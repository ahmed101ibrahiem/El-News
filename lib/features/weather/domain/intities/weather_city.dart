
import 'package:equatable/equatable.dart';

class WeatherCity extends Equatable{
  final num id;
  final String name;
  final num latitude;
  final num longitude;
  final String countryCode;
  final String timezone;


  WeatherCity(
      {required this.id,
      required this.name,
     required  this.latitude,
      required this.longitude,
      required this.countryCode,
     required this.timezone});

  @override

  List<Object?> get props => [id,name,longitude,latitude,countryCode,timezone];

}