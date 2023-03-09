
import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  final num latitude;
  final num longitude;
  final String timezone ;
  final Map<String ,dynamic> currentWeather;

  Weather({required this.latitude,required this.longitude,required this.timezone,required this.currentWeather});

  @override
  List<Object?> get props => [latitude,longitude,timezone,currentWeather];

}