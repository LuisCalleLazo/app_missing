import 'dart:io';

import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/domain/repositories/missing_repository.dart';
import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/models/missing/missing_detail_model.dart';
import 'package:app_missing/presentation/services/api_error_handle.dart';
import 'package:app_missing/shared/constants/storage_value.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MissingRepositoryImpl extends MissingRepository {
  final MissingDatasourceImpl dataSource;
  MissingRepositoryImpl(this.dataSource);

  @override
  Future<List<MissingDetail>> listMissingDetail(BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final response = await dataSource.listMissings();
      // Verificar si la respuesta tiene los datos correctos
      errorHandler.handleResponse(
        response: response,
        showSuccessSnackbar: false,
      );

      final List<MissingDetailModel> missingDetails = (response.data as List)
          .map((item) => MissingDetailModel.fromJson(item))
          .toList();

      return missingDetails;
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }

  @override
  Future<List<File>> getImgsMissing(
      int missingId, MissingPhotosType type, BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final response = await dataSource.getZipFilesMissing(missingId, type);

      // Verificar si la respuesta tiene los datos correctos
      errorHandler.handleResponse(
        response: response,
        showSuccessSnackbar: false,
      );

      final directory = await StorageDirection.getDirPhotosMissing();
      final zipFile = File('$directory/files_missing.zip');
      await zipFile.writeAsBytes(response.data);

      final archive = ZipDecoder().decodeBytes(zipFile.readAsBytesSync());

      List<File> imageFiles = [];

      for (var file in archive) {
        if (file.isFile) {
          final fileName = file.name;
          if (fileName.endsWith('.jpg') ||
              fileName.endsWith('.png') ||
              fileName.endsWith('.jpeg')) {
            final imagePath = '$directory/$fileName';
            final imageFile = File(imagePath);
            await imageFile.writeAsBytes(file.content as List<int>);
            imageFiles.add(imageFile);
          }
        }
      }

      return imageFiles;
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }

  @override
  Future<MissingDetail> createMissing(
      MissingDetailModel missing, BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final response = await dataSource.createMissing(missing.toJson());
      errorHandler.handleResponse(
        response: response,
        showSuccessSnackbar: false,
      );
      return MissingDetailModel.fromJson(response.data);
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }
}
