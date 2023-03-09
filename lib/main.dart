import 'package:api_2/features/weather/data/datasource/remote_weather_datasource.dart';
import 'package:api_2/features/weather/data/repository/weather_repository.dart';
import 'package:api_2/features/weather/domain/intities/weather.dart';
import 'package:api_2/features/weather/domain/usecase/weather_usecase.dart';
import 'package:api_2/features/weather/presentation/controller/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/inject/servie_locater.dart' as di;
import 'main_home.dart';
import 'features/weather/presentation/view/weather_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(create:
            (context) => WeatherCubit(weatherUseCase: WeatherUseCase(
              weatherRepoisitory: WeatherRepoImpl(weatherRemoteDataImpl:WeatherRemoteDataImpl() )
            )),
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  MainHomePage(),
      ),
    );
  }
}
