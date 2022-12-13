import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:md_pomodoro_timer/stores/pomodoro.store.dart';

import 'package:md_pomodoro_timer/components/input_time.dart';

class StopwatchFooter extends StatelessWidget {
  final String primaryTitle;
  final String secondaryTitle;
  // final int primaryTime;
  // final int secondaryTime;

  const StopwatchFooter({
    super.key,
    required this.primaryTitle,
    required this.secondaryTitle,
    // required this.primaryTime,
    // required this.secondaryTime,
  });

  @override
  Widget build(BuildContext context) {
    final PomodoroStore store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (BuildContext _) {
        final Color inputColor = store.isPrimary()
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.tertiary;

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 48.0,
            // horizontal: 24.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InputTime(
                color: inputColor,
                title: primaryTitle,
                value: store.primaryTime,
                disabled: store.running && store.isPrimary(),
                increment: store.incrementPrimaryTime,
                decrement: store.decrementPrimaryTime,
              ),
              InputTime(
                color: inputColor,
                title: secondaryTitle,
                value: store.secondaryTime,
                disabled: store.running && store.isSecondary(),
                increment: store.incrementSecondaryTime,
                decrement: store.decrementSecondaryTime,
              ),
            ],
          ),
        );
      }
    );
  }
}