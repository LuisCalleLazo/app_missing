import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  final BuildContext context;

  ApiErrorHandler(this.context);

  Future<void> handleResponse({
    required Response response,
    bool showSuccessSnackbar = false,
    bool showErrorSnackbar = true,
    String? successMessage,
  }) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Si todo salió bien
      if (showSuccessSnackbar && successMessage != null) {
        _showSnackbar(successMessage, Colors.green);
      }
    } else {
      // Si hay un error de lógica de negocio o credenciales incorrectas
      if (showErrorSnackbar) {
        _showSnackbar(
          response.data ?? "Algo salió mal",
          Colors.red,
        );
      }
    }
  }

  Future<void> handleError({
    required DioException error,
    bool showSnackbar = true,
  }) async {
    String errorMessage = "Ocurrió un error inesperado.";
    print(error.response);

    if (error.response != null) {
      switch (error.response!.statusCode) {
        case 400:
          errorMessage = error.response!.data ?? "Solicitud incorrecta";
          break;
        case 401:
          errorMessage = error.response!.data ?? "No autorizado";
          break;
        case 500:
          errorMessage = "Error en el servidor. Inténtalo de nuevo más tarde.";
          break;
        default:
          errorMessage = error.response!.data ?? "Error desconocido.";
          break;
      }
    } else {
      errorMessage = "No se pudo conectar con el servidor.";
    }

    if (showSnackbar) {
      _showSnackbar(errorMessage, Colors.red);
    }
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
