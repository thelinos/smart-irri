part of 'data_bloc.dart';

@freezed
class DataState with _$DataState {
  const factory DataState({
    @Default(0.0) double humidity, 
    @Default(0.0) double temperature,
    @Default(0.0) double soilMoisture,
    @Default(0.0) double waterLevel,
  }) = _DataState;
}
