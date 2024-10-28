import 'package:flutter/material.dart';

class InputPassDev extends StatelessWidget {
  const InputPassDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          vertical: 1.0, horizontal: 20.0),
      child: TextField(
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 20,
        ),
        cursorColor: const Color.fromRGBO(255, 179, 0, 1),
        obscureText: true,
        decoration: InputDecoration(
          icon: const Icon(Icons.password),
          label: const Text("Ingresa tu contraseña"),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_red_eye_sharp),
          ),
        ),
      ),
    );
  }
}
