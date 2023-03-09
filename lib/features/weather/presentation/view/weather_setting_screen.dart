
import 'package:flutter/material.dart';

class WeatherSettingScreen extends StatelessWidget {
   WeatherSettingScreen({Key? key}) : super(key: key);
  bool isActive=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Temperature Units',style: Theme.of(context).textTheme.bodyText2,),
            Switch(value: isActive, onChanged: (v){
              isActive = v;
            })
          ],
        ),
      ),
    );
  }
}
