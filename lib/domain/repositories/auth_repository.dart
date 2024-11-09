
import 'package:flutter/material.dart';

import '../../domain/entities/auth.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(String namwOrGamil, String password, BuildContext context);
  Future<AuthResponse> register(String namwOrGamil, String password);
}
