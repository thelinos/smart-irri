import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_irri_app/app_logger.dart';
import 'package:smart_irri_app/repositories/app_repository.dart';

part 'data_event.dart';
part 'data_state.dart';
part 'data_bloc.freezed.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc({required AppRepository repository})
      : _repository = repository,
        super(const DataState()) {
    on<_SoilMoistureChanged>(_onSoilMoistureChanged);
    on<_HumidityChanged>(_onHumidityChanged);
    on<_TemperatureChanged>(_onTemperatureChanged);
    on<_WaterLevelChanged>(_onWaterLevelChanged);
  }

  final AppRepository _repository;

  Future<void> _onSoilMoistureChanged(
    _SoilMoistureChanged event,
    Emitter<DataState> emit,
  ) async {
    await emit.onEach(
      _repository.soilMoistureStream,
      onData: (soiMoisture) {
        print(soiMoisture);
        emit(state.copyWith(soilMoisture: soiMoisture));
      },
    );
  }

  Future<void> _onHumidityChanged(
    _HumidityChanged event,
    Emitter<DataState> emit,
  ) async {
    await emit.onEach(
      _repository.humidityStream,
      onData: (soiMoisture) {
        print(soiMoisture);
        emit(state.copyWith(humidity: soiMoisture));
      },
    );
  }

  Future<void> _onTemperatureChanged(
    _TemperatureChanged event,
    Emitter<DataState> emit,
  ) async {
    await emit.onEach(
      _repository.temperatureStream,
      onData: (soiMoisture) {
        print(soiMoisture);
        emit(state.copyWith(temperature: soiMoisture));
      },
    );
  }

  Future<void> _onWaterLevelChanged(
    _WaterLevelChanged event,
    Emitter<DataState> emit,
  ) async {
    await emit.onEach(
      _repository.waterLevelStream,
      onData: (soiMoisture) {
        print(soiMoisture);
        emit(state.copyWith(waterLevel: soiMoisture));
      },
    );
  }

  @override
  void onTransition(Transition<DataEvent, DataState> transition) {
    super.onTransition(transition);
    AppLogger.w("Transition: $transition");
  }
}
