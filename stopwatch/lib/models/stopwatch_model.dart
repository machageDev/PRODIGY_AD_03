class StopwatchModel {
  final int milliseconds;
  final bool isRunning;

  const StopwatchModel({
    required this.milliseconds,
    required this.isRunning,
  });

  StopwatchModel copyWith({
    int? milliseconds,
    bool? isRunning,
  }) {
    return StopwatchModel(
      milliseconds: milliseconds ?? this.milliseconds,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}