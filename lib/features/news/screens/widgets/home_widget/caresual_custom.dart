import 'package:api_2/core/utils/media_quary.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/news_cubit.dart';
import '../../controller/news_state.dart';
import '../../view/details_screen.dart';


class CarousehCustome extends StatelessWidget {
  const CarousehCustome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsState>(
      builder: (context, state) {
        if(state is SuccessNewsState){
          final model = state.listData;
          return  CarouselSlider.builder(
              itemCount: model.length,
              itemBuilder: (context, index, realIndex) => GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(model: model[index],)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0)),

                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: CachedNetworkImage(

                          imageUrl:model[index].urlToImage,

                          fit: BoxFit.cover,
                        ),
                      ),
                     Container(
                       height: context.height * 0.34,
                       decoration: BoxDecoration(

                         borderRadius: BorderRadius.circular(16.0),
                           color: Colors.black38
                       ),
                       ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(),
                            Container(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('by ${model[index].source['name']}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),),
                                SizedBox(height: context.weight/28,),
                                Text(model[index].title,style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                            Text(model[index].description,
                              maxLines: 2,

                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(

                                color: Colors.white,

                                // fontWeight: FontWeight.w500
                              ),),
                            Container()
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                height: context.height * 0.34,
               // enlargeFactor: 1,
                //autoPlayCurve: Curves.linear,
                viewportFraction: 0.86,
                padEnds: true,
                initialPage: 1,
                autoPlay: true,
                //reverse: true,
              ));
        }
        else if (state is ErrorNewsState){
          return Center(
            child: Container(
                height: context.height * 0.40,
                child: ErrorGetDataWidget(text: state.error,)),
          );
        }
        else{
          return SizedBox(
              height: context.height * 0.40,
              child: Center(child: CircularProgressIndicator(),));
        }

      }

    );
  }
}

class ErrorGetDataWidget extends StatelessWidget {
  final String text;
  const ErrorGetDataWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text,style: const TextStyle(
      color: Colors.red
    ),));
  }
}
