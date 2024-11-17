import 'dart:io';

import 'package:app_missing/presentation/widgets/button/btn_icon_dev.dart';
import 'package:flutter/material.dart';

class CardMissingPhoto extends StatelessWidget {
  final File fileImage;
  const CardMissingPhoto({
    super.key,
    required this.fileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: Stack(
        children: [
          Image.file(fileImage),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 20,
              ),
              child: BtnIconDev(
                onPressed: () {},
                icon: Icons.delete,
                padd: 0,
                width: 30,
                heigth: 50,
                color: Colors.red,
                bg: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
