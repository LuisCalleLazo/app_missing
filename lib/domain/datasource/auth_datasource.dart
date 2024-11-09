
import 'package:dio/dio.dart';

import '../../domain/entities/auth.dart';

abstract class AuthDatasource {
  Future<Response> login(String nameOrGamil, String password);
  Future<AuthResponse> register(String nameOrGamil, String password);
}
