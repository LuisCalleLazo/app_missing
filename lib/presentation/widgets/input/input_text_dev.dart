import 'package:flutter/material.dart';

class InputTextDev extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? value;
  final TextInputType type;

  const InputTextDev({
    super.key,
    required this.label,
    required this.controller,
    this.value,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = value ?? "";
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 1.0,
        horizontal: 20.0,
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
        keyboardType: type,
        cursorColor: const Color.fromRGBO(55, 179, 200, 1),
        decoration: InputDecoration(
            icon: const Icon(Icons.email),
            label: Text(
              label,
              style: const TextStyle(fontSize: 22),
            ),
            iconColor: Colors.blue),
      ),
    );
  }
}
