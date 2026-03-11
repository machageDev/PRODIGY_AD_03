import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/bloc/stopwatc_events.dart';
import '../bloc/stopwatch_bloc.dart';
import '../bloc/stopwatch_state.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  String formatTime(int milliseconds) {

    int minutes = milliseconds ~/ 60000;
    int seconds = (milliseconds ~/ 1000) % 60;
    int millis = (milliseconds % 1000) ~/ 10;

    return "${minutes.toString().padLeft(2,'0')}:"
           "${seconds.toString().padLeft(2,'0')}:"
           "${millis.toString().padLeft(2,'0')}";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Stopwatch"),
        backgroundColor: Colors.blue,
      ),

      body: BlocBuilder<StopwatchBloc, StopwatchState>(
        builder: (context, state) {

          final stopwatch = state.stopwatch;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  formatTime(stopwatch.milliseconds),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: stopwatch.isRunning
                          ? null
                          : () => context.read<StopwatchBloc>().add(StartStopwatch()),
                      child: const Text("Start"),
                    ),

                    const SizedBox(width: 15),

                    ElevatedButton(
                      onPressed: stopwatch.isRunning
                          ? () => context.read<StopwatchBloc>().add(PauseStopwatch())
                          : null,
                      child: const Text("Pause"),
                    ),

                    const SizedBox(width: 15),

                    ElevatedButton(
                      onPressed: () =>
                          context.read<StopwatchBloc>().add(ResetStopwatch()),
                      child: const Text("Reset"),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}