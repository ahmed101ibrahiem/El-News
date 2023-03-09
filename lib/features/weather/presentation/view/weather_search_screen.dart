import 'package:api_2/core/utils/media_quary.dart';
import 'package:api_2/features/weather/domain/intities/weather.dart';
import 'package:api_2/features/weather/presentation/controller/weather_cubit.dart';
import 'package:api_2/features/weather/presentation/view/weather_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WeatherSearchScreen extends StatelessWidget {
   WeatherSearchScreen({Key? key}) : super(key: key);
  TextEditingController cityName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('City'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: context.height *0.02,),
            BlocBuilder<WeatherCubit,WeatherState>(
              builder: (context, state){
                final model = WeatherCubit.get(context);
                if (state is WeatherLoadedState){
                  return TextFormField(
                    controller: cityName,
                    decoration: InputDecoration(
                        hintText: 'City',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: ()async{
                            final data = await model.getLocation(city: cityName.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherHomeScreen(model: state.model,)));
                          },
                        )
                    ),
                  );
                }
               return TextFormField(
                controller: cityName,
                decoration: InputDecoration(
                  hintText: 'City',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: ()async{

                    },
                  )
                ),
              );},
            ),
          ],
        ),
      ),
    );
  }
}
