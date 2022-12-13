import 'package:flutter/material.dart';

import 'package:md_pomodoro_timer/components/stopwatch.dart';
import 'package:md_pomodoro_timer/components/stopwatch_footer.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Stopwatch(
              title: 'Pomodoro Timer',
            ),
            StopwatchFooter(
              primaryTitle: 'Work',
              secondaryTitle: 'Rest',
            ),
          ],
        ),
      ),
    );
  }
}