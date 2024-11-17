import 'dart:io';

import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/missing_repository_impl.dart';
import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/shared/utils/enum_to_value.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MissingPhotosPage extends StatelessWidget {
  static String name = "missing_photos";
  MissingPhotosPage({super.key});
  final MissingRepositoryImpl repository = MissingRepositoryImpl(MissingDatasourceImpl());

  @override
  Widget build(BuildContext context) {
    final missingProvider =
        Provider.of<MissingProvider>(context, listen: false);
    String textPhotosType = missingProvider.thisType.localizedText('es');
    
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
      body: FutureBuilder<List<File>>(
      future: repository.getImgsMissing(1, MissingPhotosType.front, context), // Aquí el ID y tipo
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
            return Image.file(imageFiles[index]);
          },
        );
      },
    ),
    );
  }
}
