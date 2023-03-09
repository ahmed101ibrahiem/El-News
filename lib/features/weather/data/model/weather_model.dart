import '../../domain/intities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {required super.latitude,
      required super.longitude,
      required super.timezone,
      required super.currentWeather});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      currentWeather: json['current_weather']??{},
      latitude: json['latitude']??0,
      longitude: json['longitude']??0,
      timezone: json['timezone']??'');
}
