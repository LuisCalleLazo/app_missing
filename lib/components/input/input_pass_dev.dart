import 'package:flutter/material.dart';

class InputPassDev extends StatefulWidget {
  const InputPassDev({super.key});

  @override
  State<InputPassDev> createState() => _InputPassDevState();
}

class _InputPassDevState extends State<InputPassDev> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          vertical: 1.0, horizontal: 20.0),
      child: TextField(
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
        cursorColor: const Color.fromRGBO(55, 179, 200, 1),
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.password,
            color: Colors.blue,
          ),
          label: const Text("Ingresa tu contraseña"),
          suffixIcon: IconButton(
            onPressed: _togglePasswordVisibility,
            icon: const Icon(Icons.remove_red_eye_sharp),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
