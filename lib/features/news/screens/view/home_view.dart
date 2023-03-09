import 'package:api_2/core/utils/media_quary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/inject/servie_locater.dart' as di;
import '../controller/news_cubit.dart';
import '../widgets/home_widget/caresual_custom.dart';
import '../widgets/home_widget/choice_category.dart';
import '../widgets/home_widget/head_home_view.dart';
import '../widgets/home_widget/list_news.dart';
import '../widgets/home_widget/title_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
        create: (context) =>di.sl<NewsCubit>()..getData(),
        child: Builder(builder: (context) {
          final cubit = NewsCubit.get(context);
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: () =>
                cubit.refreshScreen(), child:

               Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: context.weight/24,),
                      const head_home_view(),
                      const TitleWidget(),
                     const CarousehCustome(),
                      const ChangeCategoryWidget(),
                     const ListNews()
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
