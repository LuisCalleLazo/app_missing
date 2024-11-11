import 'package:flutter/material.dart';

class BtnFloatDev extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const BtnFloatDev({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: onPressed,
          heroTag: text,
          child: Icon(icon),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
