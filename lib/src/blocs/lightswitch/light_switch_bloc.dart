import 'package:bloc/bloc.dart';
import 'package:blocs_at_scale/src/util/models/data_type.dart';

// EVENTS
abstract class LightSwitchEvent extends DataType {}

class PressLightSwitch extends LightSwitchEvent {}

// STATE
abstract class LightSwitchState extends DataType {}

class LightSwitchOn extends LightSwitchState {}

class LightSwitchOff extends LightSwitchState {}

// BLOC
class LightSwitchBloc extends Bloc<LightSwitchEvent, LightSwitchState> {
  LightSwitchBloc() : super(LightSwitchOff()) {
    on<PressLightSwitch>(_mapPressLightSwitchToState);
  }

  void _mapPressLightSwitchToState(PressLightSwitch event, Emitter<LightSwitchState> emit) {
    if (state is LightSwitchOff) {
      emit(LightSwitchOn());
    } else if (state is LightSwitchOn) {
      emit(LightSwitchOff());
    } else {
      throw UnimplementedError('Handler for ($event + $state) not implemented.');
    }
  }
}
