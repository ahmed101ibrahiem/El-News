import 'package:api_2/core/utils/media_quary.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/share/erroe_widget.dart';
import '../../controller/news_cubit.dart';
import '../../controller/news_state.dart';


class ListNews extends StatelessWidget {
  const ListNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsState>(
        builder: (context, state) {
          if(state is SuccessNewsState){
            final model = state.listData;
            return SizedBox(
              width: double.infinity,
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 10.0),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.0,
                ),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(

                          imageUrl:model[index].urlToImage,

                          fit: BoxFit.cover,
                        ),
                      ),
                      height: context.height*0.20,
                      width: double.infinity,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: context.height*0.20,
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(15.0),
                        color: Colors.black26,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 20.0,bottom: 15.0,right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text('${model[index].title}',

                              style: const TextStyle(

                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),),
                            const SizedBox(height: 6.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.weight/2.5,
                                  child: Text(model[index].author,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,

                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                                Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(DateTime.parse(model[index].date)),style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                itemCount: model.length,
              ),
            );
          }
          else if (state is ErrorNewsState){
            return Center(
              child: ErrorGetDataWidget(text: state.error),
            );
          }
          else{
            return Container(
                height: context.height*0.20,
                child: Center(child: CircularProgressIndicator(),));
          }

        }

    );

  }

}

