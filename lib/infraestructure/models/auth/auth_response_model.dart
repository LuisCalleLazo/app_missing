import 'user_response_mode.dart';
import '../../../domain/entities/auth.dart';
import '../../../domain/entities/user.dart';
import 'package:app_missing/shared/constants/default_value.dart';

class AuthResponseModel extends AuthResponse {
  AuthResponseModel({
    required UserResponse user,
    required String currentToken,
    required String refreshToken,
  }) : super(currentToken: '', refreshToken: '', user: defaultUserResponse);

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: UserResponseModel.fromJson(json['user']),
      currentToken: json['currentToken'],
      refreshToken: json['refreshToken'],
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
