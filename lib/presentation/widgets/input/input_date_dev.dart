import 'package:flutter/material.dart';

class InputDateDev extends StatefulWidget {
  final String label;
  const InputDateDev({
    super.key,
    required this.label,
  });

  @override
  State<InputDateDev> createState() => _InputDateDevState();
}

class _InputDateDevState extends State<InputDateDev> {
  final double maxHeigth = 400;
  final double itemHeigth = 50;
  // Listas para los valores de días, meses y años
  final List<int> days = List.generate(31, (index) => index + 1);
  final List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];
  final List<int> years =
      List.generate(100, (index) => DateTime.now().year - index);

  // Valores seleccionados
  int? selectedDay;
  String? selectedMonth;
  int? selectedYear;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.date_range),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Día
              DropdownButton<int>(
                menuMaxHeight: maxHeigth,
                itemHeight: itemHeigth,
                hint: const Text("Día"),
                value: selectedDay,
                onChanged: (value) {
                  setState(() {
                    selectedDay = value;
                  });
                },
                items: days.map((day) {
                  return DropdownMenuItem<int>(
                    value: day,
                    child: Text(day.toString()),
                  );
                }).toList(),
              ),
              // Mes
              DropdownButton<String>(
                menuMaxHeight: maxHeigth,
                itemHeight: itemHeigth,
                hint: const Text("Mes"),
                value: selectedMonth,
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                  });
                },
                items: months.map((month) {
                  return DropdownMenuItem<String>(
                    value: month,
                    child: Text(month),
                  );
                }).toList(),
              ),
              // Año
              DropdownButton<int>(
                menuMaxHeight: maxHeigth,
                itemHeight: itemHeigth,
                hint: const Text("Año"),
                value: selectedYear,
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                  });
                },
                items: years.map((year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
