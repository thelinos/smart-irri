part of 'data_bloc.dart';

@freezed
class DataEvent with _$DataEvent {
  const factory DataEvent.onHumidityChanged() = _HumidityChanged;
  const factory DataEvent.onTemperatureChanged() = _TemperatureChanged;
  const factory DataEvent.onSoilMoistureChanged() = _SoilMoistureChanged;
  const factory DataEvent.onWaterLevelChanged() = _WaterLevelChanged;
}