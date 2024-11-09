import '../../../domain/entities/user.dart';

class UserResponseModel extends UserResponse {
  UserResponseModel({
    required int id,
    required String name,
    required String email,
    required String photo,
    required String firstName,
    required String dadLastName,
    required String momLastName,
    required int age,
    required String city,
    required String ci,
  }) : super(
          id: 0,
          name: '',
          email: '',
          photo: '',
          firstName: '',
          dadLastName: '',
          momLastName: '',
          age: 0,
          city: '',
          ci: '',
        );

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
      firstName: json['firstName'],
      dadLastName: json['dadLastName'],
      momLastName: json['momLastName'],
      age: json['age'],
      city: json['city'],
      ci: json['ci'],
    );
  }
}
