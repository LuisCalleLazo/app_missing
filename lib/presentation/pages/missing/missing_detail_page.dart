import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/presentation/widgets/button/btn_float_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_date_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_detail_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_text_dev.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class MissingDetailPage extends StatefulWidget {
  static String name = "missing_detail";

  final bool create;
  final MissingDetail detail;

  const MissingDetailPage({
    super.key,
    required this.create,
    required this.detail,
  });

  @override
  State<MissingDetailPage> createState() => _MissingDetailPageState();
}

class _MissingDetailPageState extends State<MissingDetailPage> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullnameControl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.detail.fullName),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          InputTextDev(
            controller: fullnameControl,
            label: "Ingresar su nombre completo",
          ),
          const SizedBox(height: 60),
          InputTextDev(
            controller: fullnameControl,
            label: "Tamaño aproximado",
          ),
          const SizedBox(height: 60),
          InputDetailDev(
            controller: fullnameControl,
            label: "Descripción",
          ),
          const SizedBox(height: 60),
          const InputDateDev(label: "Fecha de nacimiento"),
          const SizedBox(height: 60),
          const InputDateDev(label: "Ultima ves visto"),
          const SizedBox(height: 60),
          InputTextDev(
            controller: fullnameControl,
            label: "Genero",
          ),
          const SizedBox(height: 60),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Botones adicionales visibles solo si _isExpanded es true
          if (_isExpanded) ...[
            BtnFloatDev(
              icon: Icons.photo_album,
              text: 'Fotos de frente',
              onPressed: () {
              },
            ),
            const SizedBox(height: 10),
            BtnFloatDev(
              icon: Icons.photo_album,
              text: 'Fotos de izquierda',
              onPressed: () {
              },
            ),
            const SizedBox(height: 10),
            BtnFloatDev(
              icon: Icons.photo_album,
              text: 'Fotos de derecha',
              onPressed: () {
              },
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
    );
  }
}
