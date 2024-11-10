import 'package:app_missing/domain/entities/auth.dart';
import 'package:app_missing/infraestructure/models/auth/auth_response_model.dart';
import 'package:app_missing/presentation/services/api_error_handle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_datasource_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSourceImpl dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<AuthResponse> login(
      String email, String password, BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final response = await dataSource.login(email, password);
      // Verificar si la respuesta tiene los datos correctos
      errorHandler.handleResponse(
        response: response,
        showSuccessSnackbar: true,
        successMessage: "Inicio de sesión exitoso",
      );
      final red = AuthResponseModel.fromJson(response.data);
      return red;
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }

  @override
  Future<AuthResponse> register(String email, String password) {
    return dataSource.register(email, password);
  }
}
