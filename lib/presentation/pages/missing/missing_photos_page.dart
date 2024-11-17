import 'dart:io';

import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/missing_repository_impl.dart';
import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:app_missing/presentation/widgets/card/card_missing_photo.dart';
import 'package:app_missing/shared/utils/enum_to_value.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MissingPhotosPage extends StatefulWidget {
  static String name = "missing_photos";
  const MissingPhotosPage({super.key});

  @override
  State<MissingPhotosPage> createState() => _MissingPhotosPageState();
}

class _MissingPhotosPageState extends State<MissingPhotosPage> {
  final MissingRepositoryImpl repository =
      MissingRepositoryImpl(MissingDatasourceImpl());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final missingProvider =
        Provider.of<MissingProvider>(context, listen: false);
    String textPhotosType = missingProvider.thisType.localizedText('es');
    double widthAll = MediaQuery.of(context).size.width;

    // bool _isDataLoaded = false;
    // _loadData() {}
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fotos de $textPhotosType ${missingProvider.selectMissing.fullName}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<File>>(
            future:
                repository.getImgsMissing(1, MissingPhotosType.front, context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No images available.'));
              }

              final imageFiles = snapshot.data!;

              return ListView.builder(
                itemCount: imageFiles.length,
                itemBuilder: (context, index) {
                  return CardMissingPhoto(
                    fileImage: imageFiles[index],
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, bottom: 30),
            child: Align(
              alignment: Alignment.bottomRight,
              child: BtnTextDev(
                onPressed: () {
                  context.pop();
                },
                text: "Cancelar",
                width: (widthAll * 0.5) - 90,
                color: const Color.fromARGB(255, 9, 78, 135),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 30),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: BtnTextDev(
                onPressed: () {},
                text: "Guardar",
                width: (widthAll * 0.5) - 90,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
