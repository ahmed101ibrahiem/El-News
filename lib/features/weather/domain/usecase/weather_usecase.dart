
import 'package:api_2/features/weather/domain/intities/weather.dart';
import 'package:api_2/features/weather/domain/intities/weather_city.dart';
import 'package:api_2/features/weather/domain/repository/base_weather_repository.dart';

class WeatherUseCase{
  final WeatherRepoisitory weatherRepoisitory;

  WeatherUseCase({required this.weatherRepoisitory});
  Future<Weather> getWeather({required lat,required lon})async{
    return await weatherRepoisitory.getWeather(lat: lat, lon: lon);
  }
  Future<WeatherCity> getLocation({required String city,})async{
    return await weatherRepoisitory.getLocation(city: city);
  }
}