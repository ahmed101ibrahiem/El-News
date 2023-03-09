import 'package:api_2/features/weather/domain/intities/weather_city.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/intities/weather.dart';
import '../../domain/usecase/weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherUseCase weatherUseCase;
  WeatherCubit({required this.weatherUseCase}) : super(WeatherInitialState());
  static WeatherCubit get(context) =>BlocProvider.of(context);
  late final num lat;
  late  final num lon;

Future<void>getLocation({required String city})async{
  final WeatherCity data =await weatherUseCase.getLocation(city: city);
  lat = data.latitude;
  lat = data.longitude;
}
Future <Weather?> getWeather({required String cityName})async{
  emit(WeatherLoadingState());
  await getLocation(city: cityName);
  try{
    final Weather data = await weatherUseCase.getWeather(lat: lat, lon: lon);
    emit(WeatherLoadedState(model: data));
    return data;

  }
  catch(e){
    emit(WeatherErrorState(msg: 'Fauilar in cubit'));
  }

}


}
