import 'package:flutter/material.dart';

class BtnTextDev extends StatelessWidget {
  final String text;
  final double? width;
  final double? fontSize;
  final void Function()? onPressed;
  const BtnTextDev({
    super.key,
    required this.text,
    required this.onPressed,
    this.width, this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
        ),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          width: width ?? 350,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize ?? 25,
                fontFamily: "",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
