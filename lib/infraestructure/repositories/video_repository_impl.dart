import 'package:app_missing/domain/entities/video.dart';
import 'package:app_missing/domain/repositories/video_repository.dart';
import 'package:app_missing/infraestructure/datasource/video_datasource_impl.dart';
import 'package:app_missing/infraestructure/models/video/video_model.dart';
import 'package:app_missing/presentation/services/api_error_handle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class VideoRepositoryImpl extends VideoRepository {
  final VideoDatasourceImpl dataSource;
  VideoRepositoryImpl(this.dataSource);
  @override
  Future<List<VideoListEnt>> getListFounds(
      int missingId, BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final response = await dataSource.getListFounds(missingId);

      errorHandler.handleResponse(
        response: response,
        showSuccessSnackbar: false,
      );

      final List<VideoModel> missingDetails = (response.data as List)
          .map((item) => VideoModel.fromJson(item))
          .toList();
      return missingDetails;
      
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }
}
