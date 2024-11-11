import 'package:flutter/material.dart';

class InputDetailDev extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const InputDetailDev({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
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
          labelText: label,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
