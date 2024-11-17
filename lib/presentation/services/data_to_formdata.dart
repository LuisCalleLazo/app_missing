import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DataToFormdata {
  static Future<FormData> addImagesFormData(
      FormData formData, ValueNotifier<List<File>> files, String key) async {
    try {
      // Agregar imágenes al FormData
      for (int i = 0; i < files.value.length; i++) {
        File file = files.value[i];
        formData.files.add(MapEntry(
          key,
          await MultipartFile.fromFile(file.path,
              filename: file.path.split('/').last),
        ));
      }
      return formData;
    } catch (e) {
      return formData;
    }
  }
}
