
import 'package:dio/dio.dart';
import '../model/weather_city_model.dart';
import '../model/weather_model.dart';

abstract class WeatherRemoteData {
  Future<WeatherCityModel> getLocation({required String cityName});
  Future<WeatherModel> getCurrentWeather({required double lon,required double lat});

}
class WeatherRemoteDataImpl implements WeatherRemoteData{

  @override
  Future<WeatherCityModel> getLocation({required String cityName}) async{
    final response =await Dio().get('https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=1');
    
    if(response.statusCode ==200){
      final  data = WeatherCityModel.fromJson(response.data['results'][0]) ;
      return data;
    }
    else {
      throw Exception('no location');
    }
  }
  @override
  Future<WeatherModel> getCurrentWeather({required double lon, required double lat}) async{
    final response = await Dio().get('https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true');
    if(response .statusCode ==200){
      final WeatherModel myData = WeatherModel.fromJson(response.data);
      return myData;
    }
    else {
      throw Exception('no lat # lon');
    }
  }

}
