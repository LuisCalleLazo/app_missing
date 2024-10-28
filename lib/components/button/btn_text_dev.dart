import 'package:flutter/material.dart';

class BtnTextDev extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const BtnTextDev({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.amber),
        ),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          width: 350,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 25,
                fontFamily: "",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
