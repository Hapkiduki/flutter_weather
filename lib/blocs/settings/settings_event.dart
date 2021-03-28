part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable{}

class TemperatureUnitsToggled extends SettingsEvent {
  @override
  List<Object> get props => [];
}
