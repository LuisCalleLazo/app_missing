import '../../../domain/entities/user.dart';

class UserResponseModel extends UserResponse {
  UserResponseModel({
    required super.id,
    required super.name,
    required super.email,
    // required String photo,
    required super.firstName,
    required super.dadLastName,
    required super.momLastName,
    required super.age,
    required super.city,
    required super.ci,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      dadLastName: json['dadLastName'] ?? '',
      momLastName: json['momLastName'] ?? '',
      age: json['age'] ?? 0,
      city: json['city'] ?? '',
      ci: json['ci'] ?? '',
    );
  }
}
