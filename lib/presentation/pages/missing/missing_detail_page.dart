import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/services/input_controller_manager.dart';
import 'package:app_missing/presentation/services/value_notifier_manager.dart';
import 'package:app_missing/presentation/widgets/button/btn_float_dev.dart';
import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:app_missing/presentation/widgets/dropdown/dropdown_field_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_date_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_detail_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_text_dev.dart';
import 'package:app_missing/shared/constants/default_value.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:go_router/go_router.dart';

class MissingDetailPage extends StatefulWidget {
  static String name = "missing_detail";

  const MissingDetailPage({super.key});

  @override
  State<MissingDetailPage> createState() => _MissingDetailPageState();
}

class _MissingDetailPageState extends State<MissingDetailPage> {
  final InputControllerManager _inputManager = InputControllerManager();

  // Manejadores de dropdown
  final valueManagerInt = ValueNotifierManager<int?>();
  final valueManagerString = ValueNotifierManager<String?>();

  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final missingProvider = Provider.of<MissingProvider>(context);
    bool stateAddPhoto = false;
    // Vaiores por defecto
    double spaceSize = 30;
    double widthAll = MediaQuery.of(context).size.width;

    DateTime birthDate = missingProvider.selectMissing.birthDate;
    DateTime missingDate = missingProvider.selectMissing.missingDate;

    if ((birthDate.day != missingDate.day) ||
        (birthDate.month != missingDate.month) ||
        (birthDate.year != missingDate.year)) {
      // Valores por provider de fecha de nacimiento
      valueManagerInt.setNotifierValue(
          'date_day_birth', missingProvider.selectMissing.birthDate.day);
      valueManagerString.setNotifierValue('date_month_birth',
          monthsDefault[missingProvider.selectMissing.birthDate.month - 1]);
      valueManagerInt.setNotifierValue(
          'date_year_birth', missingProvider.selectMissing.birthDate.year);

      // Valores por provider de fecha de ultima ves visto
      valueManagerInt.setNotifierValue(
          'date_day_last', missingProvider.selectMissing.missingDate.day);
      valueManagerString.setNotifierValue('date_month_last',
          monthsDefault[missingProvider.selectMissing.missingDate.month - 1]);
      valueManagerInt.setNotifierValue(
          'date_year_last', missingProvider.selectMissing.missingDate.year);
      stateAddPhoto = true;
    }

    // Valor para seleccionar genero por defecto
    valueManagerString.setNotifierValue('gender',
        missingProvider.selectMissing.gender ? 'Masculino' : 'Femenino');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          missingProvider.selectMissing.fullName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: spaceSize - 20),
              InputTextDev(
                controller: _inputManager.getController("full_name"),
                label: "Ingresar su nombre completo",
                value: missingProvider.selectMissing.fullName,
              ),
              SizedBox(height: spaceSize),
              InputTextDev(
                controller: _inputManager.getController("size"),
                label: "Tamaño aproximado (metros)",
                value: missingProvider.selectMissing.size.toString(),
                type: TextInputType.number,
              ),
              SizedBox(height: spaceSize),
              InputDetailDev(
                controller: _inputManager.getController("description"),
                label: "Descripción",
                value: missingProvider.selectMissing.description,
              ),
              SizedBox(height: spaceSize),
              InputDateDev(
                label: "Fecha de nacimiento",
                dropdownDay: valueManagerInt.getNotifier('date_day_birth'),
                dropdownMonth:
                    valueManagerString.getNotifier('date_month_birth'),
                dropdownYear: valueManagerInt.getNotifier('date_year_birth'),
              ),
              SizedBox(height: spaceSize),
              InputDateDev(
                label: "Ultima ves visto",
                dropdownDay: valueManagerInt.getNotifier('date_day_last'),
                dropdownMonth:
                    valueManagerString.getNotifier('date_month_last'),
                dropdownYear: valueManagerInt.getNotifier('date_year_last'),
              ),
              SizedBox(height: spaceSize),
              DropdownFieldDev(
                items: const ["Masculino", "Femenino"],
                text: "Selecciona una opcion",
                width: widthAll * 0.84,
                label: "Genero",
                value: valueManagerString.getNotifier('gender'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnTextDev(
                      width: (widthAll * 0.5) - 90,
                      text: "Guardar",
                      onPressed: () {},
                    ),
                    BtnTextDev(
                      width: (widthAll * 0.5) - 90,
                      text: "Cancelar",
                      onPressed: () {
                        context.pop();
                      },
                      color: const Color.fromARGB(255, 17, 104, 191),
                    ),
                  ],
                ),
              )
            ],
          ),
          // Fondo gris semitransparente cuando los botones están expandidos
          if (_isExpanded)
            GestureDetector(
              onTap: _toggleExpand,
              child: Container(
                color: Colors.black.withOpacity(0.5), // Fondo gris
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Botones adicionales visibles solo si _isExpanded es true
                  if (_isExpanded) ...[
                    BtnFloatDev(
                      icon: Icons.photo_album,
                      text: 'Fotos de frente',
                      onPressed: () {
                        missingProvider.setTypePhotos(MissingPhotosType.front);
                        context.push('/missing/photos');
                      },
                    ),
                    const SizedBox(height: 10),
                    BtnFloatDev(
                      icon: Icons.photo_album,
                      text: 'Fotos de izquierda',
                      onPressed: () {
                        missingProvider.setTypePhotos(MissingPhotosType.left);
                        context.push('/missing/photos');
                      },
                    ),
                    const SizedBox(height: 10),
                    BtnFloatDev(
                      icon: Icons.photo_album,
                      text: 'Fotos de derecha',
                      onPressed: () {
                        missingProvider.setTypePhotos(MissingPhotosType.rigth);
                        context.push('/missing/photos');
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                  // FAB principal para expandir o contraer
                  stateAddPhoto
                      ? FloatingActionButton(
                          onPressed: _toggleExpand,
                          backgroundColor: Colors.blue[500],
                          child: Icon(_isExpanded ? Icons.close : Icons.add),
                        )
                      : const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
