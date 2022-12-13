import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:md_pomodoro_timer/stores/pomodoro.store.dart';

class Stopwatch extends StatelessWidget {
  final String title;

  const Stopwatch({
    super.key,
    required this.title,
  });

  Widget _buildTitle(BuildContext context, PomodoroStore store) {
    final Color textColor = store.isPrimary()
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.tertiary;

    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: textColor
      ),
    );
  }
  
  Widget _buildTimer(BuildContext context, PomodoroStore store) {
    final Color textColor = store.isPrimary()
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.tertiary;

    return Text(
      '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
        color: textColor,
      ),
    );
  }

  Widget _buildButtons(BuildContext context, PomodoroStore store) {
    final Color btnForegroundColor = store.isPrimary()
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.tertiary;

    final ButtonStyle btnStyle = TextButton.styleFrom(
      foregroundColor: btnForegroundColor
    );
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton.icon(
          style: btnStyle,
          label: Text(store.running ? 'Stop' : 'Start'),
          icon: Icon(store.running ? Icons.stop_rounded : Icons.play_arrow_rounded),
          onPressed: store.running ? store.stop : store.start,
        ),
        TextButton.icon(
          style: btnStyle,
          label: const Text('Restart'),
          icon: const Icon(Icons.refresh_rounded),
          onPressed: store.running ? store.refresh : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final PomodoroStore store = Provider.of<PomodoroStore>(context);
    
    return Expanded(
      child: Observer(
        builder: (BuildContext _) =>  Container(
          padding: const EdgeInsets.symmetric(
            vertical: 48.0,
          ),
          color: store.isPrimary()
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.tertiaryContainer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(context, store),
              _buildTimer(context, store),
              _buildButtons(context, store),
            ],
          ),
        ),
      ),
    );
  }
}