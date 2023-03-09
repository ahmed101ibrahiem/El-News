

import 'package:api_2/features/weather/data/datasource/remote_weather_datasource.dart';
import 'package:api_2/features/weather/data/model/weather_city_model.dart';
import 'package:api_2/features/weather/data/model/weather_model.dart';
import 'package:api_2/features/weather/domain/intities/weather.dart';
import 'package:api_2/features/weather/domain/intities/weather_city.dart';
import 'package:api_2/features/weather/domain/repository/base_weather_repository.dart';

class WeatherRepoImpl implements WeatherRepoisitory{
  final WeatherRemoteDataImpl weatherRemoteDataImpl;

  WeatherRepoImpl({required this.weatherRemoteDataImpl});

  @override
  Future<WeatherCity> getLocation({required String city})async {
    return await weatherRemoteDataImpl.getLocation(cityName: city);
  }

  @override
  Future<Weather> getWeather({required double lat, required double lon}) async{
    return await weatherRemoteDataImpl.getCurrentWeather(lon: lon, lat: lat);
  }

}