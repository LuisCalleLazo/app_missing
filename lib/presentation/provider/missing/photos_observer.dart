import 'dart:io';

import 'package:app_missing/presentation/pages/missing/missing_photos_page.dart';
import 'package:app_missing/shared/constants/storage_value.dart';
import 'package:flutter/material.dart';

class PhotosObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name == MissingPhotosPage.name) {
      _cleanTemporaryFiles();
    }

    super.didPop(route, previousRoute);
  }

  Future<void> _cleanTemporaryFiles() async {
    // Obtiene el directorio temporal
    final directory = await StorageDirection.getDirPhotosMissing();
    final tempDir = Directory(directory);

    try {
      final List<FileSystemEntity> files = tempDir.listSync();
      for (var file in files) {
        if (file is File) {
          await file.delete(); // Elimina el archivo
        }
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
