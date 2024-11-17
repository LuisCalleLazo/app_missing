import 'package:flutter/material.dart';

class BtnTextDev extends StatefulWidget {
  final String text;
  final double? width;
  final double? heigth;
  final double? fontSize;
  final Color color;
  final bool disable;
  final void Function()? onPressed;
  const BtnTextDev({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.fontSize,
    this.color = Colors.blue,
    this.heigth,
    this.disable = false,
  });

  @override
  State<BtnTextDev> createState() => _BtnTextDevState();
}

class _BtnTextDevState extends State<BtnTextDev> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(widget.color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: !widget.disable ? widget.onPressed : null,
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          width: widget.width ?? 350,
          height: widget.heigth ?? 55,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize ?? 25,
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
