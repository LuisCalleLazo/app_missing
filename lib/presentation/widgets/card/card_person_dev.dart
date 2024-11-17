import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CardPersonDev extends StatelessWidget {
  final MissingDetail data;
  const CardPersonDev({
    super.key,
    required this.data,
  });
  static const IconData warning = IconData(0xe6cb, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    final missingProvider = Provider.of<MissingProvider>(context);
    final birthDate = data.birthDate;
    final missgDate = data.missingDate;

    // Icons para tarjeta:
    Icon iconAdvert = const Icon(warning, color: Colors.amber);
    Icon iconVerified = const Icon(Icons.verified_sharp);
    return InkWell(
      onTap: () {
        missingProvider.setSelectMissing(data);
        context.push("/missing/detail");
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
                fieldName: data.fullName,
                value: Row(
                  children: [
                    const Text("front"),
                    !data.photosFront ? iconAdvert : iconVerified,
                    const SizedBox(width: 10),
                    const Text("left"),
                    !data.photosLeft ? iconAdvert : iconVerified,
                    const SizedBox(width: 10),
                    const Text("rigth"),
                    !data.photosRigth ? iconAdvert : iconVerified,
                  ],
                ),
              ),
              FieldView(
                fieldName: "Fecha de nacimiento",
                value: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                      '${birthDate.year} / ${birthDate.month} / ${birthDate.day}'),
                ),
              ),
              FieldView(
                fieldName: "Fecha de desaparición",
                value: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                      '${missgDate.year} / ${missgDate.month} / ${missgDate.day}'),
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
              FieldView(
                fieldName: "Tamaño",
                value: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text("${data.size} [m]"),
                ),
              ),
              FieldView(
                fieldName: "Sexo",
                value: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(data.gender ? "Hombre" : "Mujer"),
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
    super.key,
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
