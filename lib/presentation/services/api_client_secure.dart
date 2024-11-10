import 'package:app_missing/shared/constants/storage_value.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiSecure {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL']!,
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 5000),
    ),
  );

  ApiSecure() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        const storage = FlutterSecureStorage();
        final currentToken = await storage.read(key: StorageKey.getCurrentToken());
        if (currentToken != null) {
          options.headers['Authorization'] = 'Bearer $currentToken';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          const FlutterSecureStorage().delete(key: StorageKey.getCurrentToken());
          const FlutterSecureStorage().delete(key: StorageKey.getRefreshToken());
          const FlutterSecureStorage().delete(key: StorageKey.getUser());
        }
        return handler.next(e);
      },
    ));
  }
  Dio get client => _dio;
}

final apiSecure = ApiSecure().client;
