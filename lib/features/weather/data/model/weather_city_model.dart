import 'package:api_2/features/weather/domain/intities/weather_city.dart';

class WeatherCityModel extends WeatherCity {
  WeatherCityModel(
      {required super.id,
      required super.name,
      required super.latitude,
      required super.longitude,
      required super.countryCode,
      required super.timezone});

  factory WeatherCityModel.fromJson(Map<String, dynamic> json) =>
      WeatherCityModel(
          id: json['id']??0,
          name: json['name']??'',
          latitude: json['latitude']??0,
          longitude: json['longitude']??0,
          countryCode: json['country_code']??'',
          timezone: json['timezone']??'');
}
