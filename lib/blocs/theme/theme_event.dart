part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class WeatherChanged extends ThemeEvent {
  final WeatherCondition condition;

  const WeatherChanged({required this.condition});

  @override
  List<Object> get props => [condition];
}
