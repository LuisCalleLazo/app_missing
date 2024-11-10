import 'user.dart';

class AuthResponse {
  final UserResponse user;
  final String currentToken;
  final String refreshToken;

  AuthResponse({
    required this.user,
    required this.currentToken,
    required this.refreshToken,
  });
  
}
