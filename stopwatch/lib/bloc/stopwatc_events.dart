import 'package:equatable/equatable.dart';

abstract class StopwatchEvent extends Equatable {
  const StopwatchEvent();

  @override
  List<Object?> get props => [];
}

class StartStopwatch extends StopwatchEvent {}

class PauseStopwatch extends StopwatchEvent {}

class ResetStopwatch extends StopwatchEvent {}

class Tick extends StopwatchEvent {
  final int milliseconds;

  const Tick(this.milliseconds);

  @override
  List<Object?> get props => [milliseconds];
}