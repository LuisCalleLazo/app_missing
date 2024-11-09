import 'package:flutter/material.dart';

class InputSearchDev extends StatelessWidget {
  const InputSearchDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Container(
        color: Colors.transparent,
        height: 300,
        child: TextField(
          style: const TextStyle(
            height: 1.3,
            fontSize: 21,
          ),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
