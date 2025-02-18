import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../hooks/use_side_effect.dart';

class ActionButton extends HookWidget {
  const ActionButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.icon,
      this.disabled = false,
      this.style});
  final AsyncCallback onPressed;
  final Widget label;
  final Widget? icon;
  final ButtonStyle? style;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final (clear: _, :mutate, :snapshot) = useSideEffect<void>();
    Future<void> pressButton() async {
      final future = onPressed();
      mutate(future);
      try {
        await future;
      } catch (exception) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong $exception')),
        );
      }
    }

    return ElevatedButton.icon(
      onPressed: disabled
          ? null
          : switch (snapshot) {
              AsyncSnapshot(connectionState: ConnectionState.waiting) => null,
              _ => pressButton,
            },
      style: style,
      label: label,
    );
  }
}
