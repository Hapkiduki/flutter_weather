import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/blocs.dart';
import 'package:http/http.dart' as http;

import 'repositories/repositories.dart';
import 'blocs/simple_bloc_observer.dart';
import 'widgets/widgets.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final weatherRepository = WeatherRepository(
      weatherApiClient: WeatherApiClient(httpClient: http.Client()));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (_) => ThemeBloc(),
      ),
      BlocProvider<SettingsBloc>(
        create: (_) => SettingsBloc(),
      ),
    ],
    child: MyApp(weatherRepository: weatherRepository),
  ));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Weather',
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (_) => WeatherBloc(weatherRepository: weatherRepository),
            child: Weather(),
          ),
        );
      },
    );
  }
}
