import 'package:api_2/core/utils/media_quary.dart';
import 'package:api_2/features/weather/domain/intities/weather.dart';
import 'package:api_2/features/weather/presentation/view/weather_search_screen.dart';
import 'package:api_2/features/weather/presentation/view/weather_setting_screen.dart';
import 'package:flutter/material.dart';

class WeatherHomeScreen extends StatelessWidget {
  final Weather model;
  const WeatherHomeScreen({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Flutter Weather'),
      actions: [
        IconButton(onPressed: (){
          // nav to settings screen
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherSettingScreen()));

        }, icon: const Icon(Icons.settings)),
        IconButton(onPressed: (){
          // nav to search screen
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherSearchScreen()));
        }, icon: const Icon(Icons.search))
      ],
    ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 38.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade700,
              Colors.blue.shade500
            ]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: context.height*0.1,),
               Text(model.currentWeather['temperature'].toString(),style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),),
              Text('update 12:41 AM',style: TextStyle(
                color: Colors.white70,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: context.height*0.1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('data',),
                  Text('25',style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),),
                  Column(
                    children: [
                      Text('max: 20',style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('min: -12',style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  )
                ],
              ),
              SizedBox(height: context.height*0.1,),
              const Text('Showers',style: TextStyle(
                color: Colors.white60,
                fontSize: 32
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
