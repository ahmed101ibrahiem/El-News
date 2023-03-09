part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherLoadedState extends WeatherState {
  final Weather model;

  WeatherLoadedState({required this.model});

  @override
  List<Object> get props => [];
}
class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherErrorState extends WeatherState {
  final String msg;
  WeatherErrorState({required this.msg});

  @override
  List<Object> get props => [];
}
