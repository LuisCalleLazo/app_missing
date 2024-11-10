import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/domain/repositories/missing_repository.dart';
import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/models/missing/missing_detail_model.dart';
import 'package:app_missing/presentation/services/api_error_handle.dart';
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
}
