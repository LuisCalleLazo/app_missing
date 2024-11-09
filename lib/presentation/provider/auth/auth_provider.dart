
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

  Future<void> register(String nameOremail, String password) async {
    _current = await authRepository.register(nameOremail, password);
    notifyListeners();
  }

  void logout() {
    _current = null;
    notifyListeners();
  }
}
