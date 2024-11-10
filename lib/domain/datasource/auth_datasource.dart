
import 'package:dio/dio.dart';

import '../../domain/entities/auth.dart';

abstract class AuthDatasource {
  Future<Response> login(String nameOrGamil, String password);
  Future<Response> refreshToken(String tokenExpired, String refreshToken);
  Future<AuthResponse> register(String nameOrGamil, String password);
}
