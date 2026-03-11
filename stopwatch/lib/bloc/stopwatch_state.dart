import 'package:equatable/equatable.dart';

class StopwatchState extends Equatable {

  final int milliseconds;
  final bool isRunning;

  const StopwatchState({
    required this.milliseconds,
    required this.isRunning,
  });

  factory StopwatchState.initial() {
    return const StopwatchState(
      milliseconds: 0,
      isRunning: false,
    );
  }

  StopwatchState copyWith({
    int? milliseconds,
    bool? isRunning,
  }) {
    return StopwatchState(
      milliseconds: milliseconds ?? this.milliseconds,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  @override
  List<Object?> get props => [milliseconds, isRunning];
}