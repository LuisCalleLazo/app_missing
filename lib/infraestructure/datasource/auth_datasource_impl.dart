import '../../domain/datasource/auth_datasource.dart';
import '../models/auth/auth_response_model.dart';
import 'package:dio/dio.dart';
import '../../presentation/services/api_client.dart';

class AuthDataSourceImpl extends AuthDatasource {
  final Dio _client = api;

  @override
  Future<Response> login(String nameOrGamil, String password) async {
    final response = await _client.post('/api/v1/auth/login', data: {
      'nameOrGmail': nameOrGamil,
      'password': password,
    });
    return response;
  }

  @override
  Future<AuthResponseModel> register(
      String nameOrGamil, String password) async {
    final response = await _client.post('/register', data: {
      'email': nameOrGamil,
      'password': password,
    });
    return AuthResponseModel.fromJson(response.data);
  }
}
