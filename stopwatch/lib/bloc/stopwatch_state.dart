import 'package:equatable/equatable.dart';
import '../models/stopwatch_model.dart';

class StopwatchState extends Equatable {

  final StopwatchModel stopwatch;

  const StopwatchState({required this.stopwatch});

  factory StopwatchState.initial() {
    return const StopwatchState(
      stopwatch: StopwatchModel(
        milliseconds: 0,
        isRunning: false,
      ),
    );
  }

  StopwatchState copyWith({
    StopwatchModel? stopwatch,
  }) {
    return StopwatchState(
      stopwatch: stopwatch ?? this.stopwatch,
    );
  }

  @override
  List<Object?> get props => [stopwatch];
}