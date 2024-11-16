import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/services/input_controller_manager.dart';
import 'package:app_missing/presentation/services/value_notifier_manager.dart';
import 'package:app_missing/presentation/widgets/button/btn_float_dev.dart';
import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:app_missing/presentation/widgets/dropdown/dropdown_field_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_date_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_detail_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_text_dev.dart';
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
  final ValueNotifier<String?> dropdownGender = ValueNotifier<String?>(null);
  final ValueNotifierManager<int?> valueManagerInt =
      ValueNotifierManager<int?>();
  final ValueNotifierManager<String?> valueManagerString =
      ValueNotifierManager<String?>();
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    double spaceSize = 30;
    final missingProvider = Provider.of<MissingProvider>(context);
    double widthAll = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(missingProvider.selectMissing.fullName),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
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
            label: "Tamaño aproximado",
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
            dropdownDay: valueManagerInt.getNotifier('firstDropdown'),
            dropdownMonth: valueManagerString.getNotifier('firstDropdown'),
            dropdownYear: valueManagerInt.getNotifier('firstDropdown'),
          ),
          SizedBox(height: spaceSize),
          InputDateDev(
            label: "Ultima ves visto",
            dropdownDay: valueManagerInt.getNotifier('firstDropdown'),
            dropdownMonth: valueManagerString.getNotifier('firstDropdown'),
            dropdownYear: valueManagerInt.getNotifier('firstDropdown'),
          ),
          SizedBox(height: spaceSize),
          DropdownFieldDev(
            items: const ["Masculino", "Femenino"],
            text: "Selecciona una opcion",
            width: widthAll * 0.84,
            label: "Sexo",
            value: dropdownGender,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Botones adicionales visibles solo si _isExpanded es true
            if (_isExpanded) ...[
              BtnFloatDev(
                icon: Icons.photo_album,
                text: 'Fotos de frente',
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              BtnFloatDev(
                icon: Icons.photo_album,
                text: 'Fotos de izquierda',
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              BtnFloatDev(
                icon: Icons.photo_album,
                text: 'Fotos de derecha',
                onPressed: () {},
              ),
              const SizedBox(height: 10),
            ],
            // FAB principal para expandir o contraer
            FloatingActionButton(
              onPressed: _toggleExpand,
              child: Icon(_isExpanded ? Icons.close : Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
