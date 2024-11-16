import 'package:flutter/material.dart';

class BtnTextDev extends StatelessWidget {
  final String text;
  final double? width;
  final double? fontSize;
  final Color color;
  final void Function()? onPressed;
  const BtnTextDev({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.fontSize,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
