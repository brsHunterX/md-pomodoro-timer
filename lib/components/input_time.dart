import 'package:flutter/material.dart';

class InputTime extends StatelessWidget {
  final int value;
  final String title;
  final Color? color;
  final bool disabled;
  final void Function()? increment;
  final void Function()? decrement;

  const InputTime({
    super.key,
    required this.value,
    required this.title,
    this.color,
    this.disabled = false,
    this.increment,
    this.decrement,
  });

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: disabled
            ? Theme.of(context).colorScheme.onBackground.withOpacity(0.5)
            : Theme.of(context).colorScheme.onBackground
        )
      ),
    );
  }

  Widget _buildDecrementTimeButton(BuildContext context) {
    final ButtonStyle btnStyle = IconButton.styleFrom(
      foregroundColor: color ?? Theme.of(context).colorScheme.primary
    );

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        style: btnStyle,
        onPressed: disabled ? null : decrement,
        icon: const Icon(Icons.keyboard_arrow_down_rounded)
      ),
    );
  }

  Widget _buildTimeCounter(BuildContext context) {
    final Color textColor = color ?? Theme.of(context).colorScheme.primary;

    return Text(
      '$value min',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: disabled ? textColor.withOpacity(0.5) : textColor
      )
    );
  }

  Widget _buildIncrementTimeCounter(BuildContext context) {
    final ButtonStyle btnStyle = IconButton.styleFrom(
      foregroundColor: color ?? Theme.of(context).colorScheme.primary
    );

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        style: btnStyle,
        onPressed: disabled ? null : increment,
        icon: const Icon(Icons.keyboard_arrow_up_rounded)
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDecrementTimeButton(context),
        _buildTimeCounter(context),
        _buildIncrementTimeCounter(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitle(context),
        _buildInput(context),
      ],
    );
  }
}