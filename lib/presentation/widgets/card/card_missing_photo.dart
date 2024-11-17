import 'dart:io';

import 'package:app_missing/presentation/widgets/button/btn_icon_dev.dart';
import 'package:flutter/material.dart';

class CardMissingPhoto extends StatelessWidget {
  final File fileImage;
  final VoidCallback onDelete;
  const CardMissingPhoto({
    super.key,
    required this.fileImage,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.file(fileImage),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 20,
              ),
              child: BtnIconDev(
                onPressed: () async {
                  final result = await _showDeleteDialog(context);
                  if (result == true) {
                    onDelete();
                  }
                },
                icon: Icons.delete,
                padd: 0,
                width: 30,
                heigth: 50,
                color: Colors.redAccent,
                bg: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> _showDeleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content:
              const Text('¿Estás seguro de que quieres eliminar esta imagen?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.blue[700]),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Eliminar',
                style: TextStyle(color: Colors.blue[500]),
              ),
            ),
          ],
        );
      },
    );
  }
}
