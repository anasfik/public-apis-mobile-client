import 'package:flutter/material.dart';

class AlertTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? textColor;
  final bool boldText;

  const AlertTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.boldText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: theme.textTheme.labelSmall?.copyWith(
          color: textColor ?? theme.scaffoldBackgroundColor,
          fontWeight: boldText ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
