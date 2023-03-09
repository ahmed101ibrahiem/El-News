import 'package:api_2/core/utils/media_quary.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/intities/news.dart';


class DetailsScreen extends StatelessWidget {
  final News model;
  const DetailsScreen({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height:410,child: _head(context,model)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.content,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      height: 1.9,
                      color: Color(0xFF2E0505),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                     // color: Colors.black,
                    )
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                      model.description,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        height: 1.7,
                        color: Color(0xFF2E0505),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        // color: Colors.black,
                      )
                  ),

                ],
              ),
            ),
          )
        ],
      ),

      )
    );
  }


  Widget _head(BuildContext context, News model) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                //color: Colors.teal
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(imageUrl: model.urlToImage,
                    fit: BoxFit.cover,
                    height: 330,
                  ),
                  // arrow
                  Positioned(
                    left: 20,
                    top: 38,
                    child: Container(

                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color.fromRGBO(250, 250, 250, 0.7),
                      ),
                      child: IconButton(
                        onPressed: (){
                          /// back
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new,color: Colors.black87,size: 17,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // center container
        Positioned(

          top: 250,
          child: Container(

            height: 136,
            width: context.weight/1.2,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 245, 245, 0.6),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0,6),
                  blurRadius: 12.0
                )
              ]

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(DateTime.parse(model.date)),style: TextStyle(
                    color: Colors.black87
                  ),),
                  Text(model.title,maxLines: 3,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Color(0xFF2E0505),
                      fontWeight: FontWeight.bold,
                    fontSize: 16
                  )),
                  Text('Published by ${model.author}',style: TextStyle(
                    color: Colors.black,
                  ),)
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}

//
// Column(
// children: [
// Container(
// height: 350,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.teal,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(20),
// bottomRight: Radius.circular(20)
// )
// ),
// child: Stack(
// children: [
// Positioned(
// top: 35,
// right: 30,
// child: Container(
// height: 40,
// width: 40,
// decoration: BoxDecoration(
// color: const Color.fromRGBO(250, 250, 250, 0.3),
// borderRadius: BorderRadius.circular(8),
// ),
// child: const Icon(Icons.arrow_back_ios_new,size: 30,color: Colors.white,),
// ),
// ),
//
// ],
// ),
// ),
// ],
// ),
// Positioned
// (
// top: 200,
// left: 37,
// child: Container(
// color: Colors.red,
// height: 170.0,
// width: 260,
//
// ))