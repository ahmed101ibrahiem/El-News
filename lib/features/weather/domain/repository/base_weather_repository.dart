


import 'dart:core';
import '../intities/weather.dart';
import '../intities/weather_city.dart';

abstract class WeatherRepoisitory{
  Future<Weather> getWeather({required double lat,required double lon });
  Future<WeatherCity> getLocation({required String city});

}