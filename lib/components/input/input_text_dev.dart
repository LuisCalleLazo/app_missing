import 'package:flutter/material.dart';

class InputTextDev extends StatelessWidget {
  final String label;

  const InputTextDev({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 1.0, horizontal: 20.0),
      child: TextField(
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
        cursorColor: const Color.fromRGBO(55, 179, 200, 1),
        decoration: InputDecoration(
          icon: const Icon(Icons.email),
          label: Text(label),
          iconColor: Colors.blue
        ),
      ),
    );
  }
}
