import 'user_response_mode.dart';
import '../../../domain/entities/auth.dart';
import 'package:app_missing/shared/constants/default_value.dart';

class AuthResponseModel extends AuthResponse {
  AuthResponseModel({
    required super.user,
    required super.currentToken,
    required super.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: json['user'] != null ? UserResponseModel.fromJson(json['user']) : defaultUserResponse,
      currentToken: json['currentToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'currentToken': currentToken,
      'refreshToken': refreshToken,
    };
  }
}
