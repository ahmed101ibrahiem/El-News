import 'package:api_2/core/utils/media_quary.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: context.height * 0.057,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Latest News',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Row(
            children: const [
              Text(
                'See All',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(width: 8,),
              Icon(
                Icons.arrow_forward,
                color: Colors.blue,
                size: 18,
              )
            ],
          )
        ],
      ),
    );
  }
}
