import 'package:flutter/material.dart';

class InputDetailDev extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? value;
  const InputDetailDev({
    super.key,
    required this.label,
    required this.controller,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = value ?? "";
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
        maxLines: 5,
        cursorColor: const Color.fromRGBO(55, 179, 200, 1),
        decoration: InputDecoration(
          icon: const Icon(Icons.email),
          label: Text(
            label,
            style: const TextStyle(fontSize: 22),
          ),
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
