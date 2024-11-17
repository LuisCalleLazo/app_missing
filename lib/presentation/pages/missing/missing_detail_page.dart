import 'package:app_missing/domain/entities/missing.dart';
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
  late MissingProvider missingProvider;
  late bool stateAddPhoto;

  @override
  void initState() {
    super.initState();
    stateAddPhoto = false;
    missingProvider = Provider.of<MissingProvider>(context, listen: false);
    _initializeValues();
  }

  void _initializeValues() {
    // Aquí puedes establecer los valores iniciales
    DateTime birthDate = missingProvider.selectMissing.birthDate;
    DateTime missingDate = missingProvider.selectMissing.missingDate;

    if ((birthDate.day != missingDate.day) ||
        (birthDate.month != missingDate.month) ||
        (birthDate.year != missingDate.year)) {
      // Establece los valores en valueManager
      valueManagerInt.setNotifierValue('date_day_birth', birthDate.day);
      valueManagerString.setNotifierValue(
          'date_month_birth', monthsDefault[birthDate.month - 1]);
      valueManagerInt.setNotifierValue('date_year_birth', birthDate.year);
      valueManagerInt.setNotifierValue('date_day_last', missingDate.day);
      valueManagerString.setNotifierValue(
          'date_month_last', monthsDefault[missingDate.month - 1]);
      valueManagerInt.setNotifierValue('date_year_last', missingDate.year);
      stateAddPhoto = true;
    }

    valueManagerString.setNotifierValue('gender',
        missingProvider.selectMissing.gender ? 'Masculino' : 'Femenino');

    _inputManager.setControllerValue(
        "full_name", missingProvider.selectMissing.fullName);
    _inputManager.setControllerValue(
        "size", missingProvider.selectMissing.size.toString());
    _inputManager.setControllerValue(
        "description", missingProvider.selectMissing.description);
  }

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
    // Vaiores por defecto
    double spaceSize = 30;
    double widthAll = MediaQuery.of(context).size.width;

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
                color: Colors.black,
                controller: _inputManager.getController("full_name"),
                label: "Ingresar su nombre completo",
                value: _inputManager.getController("full_name").text,
              ),
              SizedBox(height: spaceSize),
              InputTextDev(
                color: Colors.black,
                controller: _inputManager.getController("size"),
                label: "Tamaño aproximado (metros)",
                value: _inputManager.getController("size").text,
                type: TextInputType.number,
              ),
              SizedBox(height: spaceSize),
              InputDetailDev(
                controller: _inputManager.getController("description"),
                label: "Descripción",
                value: _inputManager.getController("description").text,
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
                      onPressed: () async {
                        if (missingProvider.forCreate) {
                          await missingProvider.addMissingDetail(
                            createMissingDetailFromInputs(
                              valueManagerInt,
                              valueManagerString,
                              _inputManager,
                            ),
                            context,
                          );
                        }

                        // ignore: use_build_context_synchronously
                        context.pop();
                      },
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

  MissingDetail createMissingDetailFromInputs(
    ValueNotifierManager<int?> managerInt,
    ValueNotifierManager<String?> managerString,
    InputControllerManager controllerInput,
  ) {
    // Aquí obtienes los valores de los TextEditingController
    final stringValues = managerString.getAllValues();
    final intValues = managerInt.getAllValues();
    final inputValues = controllerInput.getAllValues();

    // Crear el objeto MissingDetail
    return MissingDetail(
      id: 0, // Asigna un ID según sea necesario
      birthDate: DateTime(
        intValues['date_year_birth'] ?? 1,
        monthsDefault.indexOf(stringValues['date_month_birth'] ?? "Enero"),
        intValues['date_day_birth'] ?? DateTime.now().year,
      ),
      missingDate: DateTime(
        intValues['date_year_last'] ?? 1,
        monthsDefault.indexOf(stringValues['date_month_last'] ?? "Enero"),
        intValues['date_day_last'] ?? DateTime.now().year,
      ),
      fullName: inputValues['full_name'] ?? "",
      size: double.parse(inputValues['size'] ?? "0"),
      gender: stringValues['gender'] != null
          ? stringValues['gender'] == 'Masculino'
              ? true
              : false
          : false,
      description: inputValues['description'] ?? "",
      lastSeenMap: "",
      found: false,
      photosFront: false,
      photosLeft: false,
      photosRigth: false,
    );
  }
}
