import 'package:app_missing/presentation/widgets/dropdown/dropdown_dev.dart';
import 'package:flutter/material.dart';

class DropdownFieldDev extends StatefulWidget {
  final List<String> items;
  final String text;
  final double width;
  final double heigth;
  final String label;
  final ValueNotifier<String?> value;
  const DropdownFieldDev({
    super.key,
    required this.items,
    required this.text,
    this.width = double.infinity,
    this.heigth = 50,
    this.label = "Seleccion",
    required this.value,
  });

  @override
  State<DropdownFieldDev> createState() => _DropdownDefultState();
}

class _DropdownDefultState extends State<DropdownFieldDev> {
  String? selectedValue;
  final ValueNotifier<String?> value = ValueNotifier<String?>(null);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.abc,
                size: 30,
              ),
              SizedBox(
                width: widget.width,
                height: widget.heigth,
                child: DropdownDev(
                  items: widget.items,
                  text: widget.text,
                  width: widget.width,
                  value: value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
