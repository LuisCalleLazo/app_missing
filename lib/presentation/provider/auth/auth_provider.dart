
import 'package:app_missing/domain/entities/auth.dart';
import 'package:app_missing/infraestructure/datasource/auth_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepositoryImpl authRepository = AuthRepositoryImpl(AuthDataSourceImpl());

  AuthResponse? _current;

  AuthResponse? get current => _current;

  Future<void> login(String nameOremail, String password, BuildContext context) async {
    _current = await authRepository.login(nameOremail, password, context);
    notifyListeners();
    // ignore: use_build_context_synchronously
    context.push('/home');
  }

  Future<void> refreshAuthToken() async {
    if (_current != null) {
      // final response = await _client.post('/api/v1/auth/refresh', data: {
      //   'refreshToken': _authResponse!.refreshToken,
      // });

      // if (response.statusCode == 200) {
        // _current!.currentToken = response.data['currentToken'];
        notifyListeners();
      // } else {
        // Manejo de errores
      // }
    }
  }

  Future<void> register(String nameOremail, String password) async {
    _current = await authRepository.register(nameOremail, password);
    notifyListeners();
  }

  void logout() {
    _current = null;
    notifyListeners();
  }
}
