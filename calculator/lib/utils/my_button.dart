import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final String buttonText;
  final Color? textColor;
  final VoidCallback onPressed;
  const MyButton({
    super.key,
    required this.color,
    required this.buttonText,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isChar(String x) {
      if (x == 'C' || x == 'Del' || x == 'AC') {
        return true;
      } else {
        return false;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            style: isChar(buttonText)
                ? Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: textColor)
                : Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
