import 'package:api_2/core/utils/media_quary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/news_cubit.dart';
import '../../controller/news_state.dart';


class ChangeCategoryWidget extends StatelessWidget {
  const ChangeCategoryWidget({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: context.weight/10,
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            final cubitData = NewsCubit.get(context);
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cubitData.listOfCategory.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                   cubitData.clicKCategory(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: cubitData.selectIndex == index
                              ? [
                            const Color(0xFFFF8086),
                            const Color(
                              0xFFFF3A44,
                            ),
                          ]
                              : [
                            const Color(0xFFF0F1FA),
                            const Color(0xFFFFFFFF)
                          ],
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius:
                        BorderRadius.circular(50.0)),

                    // width: context.weight / 4,
                    child: Center(
                      child: Text(
                        cubitData.listOfCategory[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: cubitData.selectIndex == index
                              ? const Color(0xffFFFFFF)
                              : const Color(0xff2E0505),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

