import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/bloc/stopwatc_events.dart';
import 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {

  Timer? _timer;

  StopwatchBloc() : super(StopwatchState.initial()) {

    on<StartStopwatch>(_onStart);
    on<PauseStopwatch>(_onPause);
    on<ResetStopwatch>(_onReset);
    on<Tick>(_onTick);
  }

  void _onStart(StartStopwatch event, Emitter<StopwatchState> emit) {

    if (state.isRunning) return;

    _timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        add(Tick(state.milliseconds + 10));
      },
    );

    emit(state.copyWith(isRunning: true));
  }

  void _onPause(PauseStopwatch event, Emitter<StopwatchState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  void _onReset(ResetStopwatch event, Emitter<StopwatchState> emit) {
    _timer?.cancel();
    emit(const StopwatchState(milliseconds: 0, isRunning: false));
  }

  void _onTick(Tick event, Emitter<StopwatchState> emit) {
    emit(state.copyWith(milliseconds: event.milliseconds));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}