import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardPersonDev extends StatelessWidget {
  const CardPersonDev({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/notification");
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        child: Container(
          height: 350,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FieldView(
                fieldName: "Jose Miguel Quispe",
                value: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://indiehoy.com/wp-content/uploads/2018/04/aurora.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const FieldView(
                fieldName: "Fecha de nacimiento",
                value: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text("2003 / 09 / 25"),
                ),
              ),
              const FieldView(
                fieldName: "Fecha de desaparición",
                value: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text("2003 / 11 / 09"),
                ),
              ),
              FieldView(
                fieldName: "Ultima ubicación",
                value: BtnTextDev(
                  text: "Google Maps",
                  onPressed: () {},
                  width: 120,
                  fontSize: 17,
                ),
              ),
              const FieldView(
                fieldName: "Tamaño",
                value: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text("1,87 [m]"),
                ),
              ),
              const FieldView(
                fieldName: "Sexo",
                value: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text("Hombre"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FieldView extends StatelessWidget {
  final String fieldName;
  final Widget value;
  const FieldView({
    required this.fieldName,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          value,
        ],
      ),
    );
  }
}
