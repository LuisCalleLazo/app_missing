class UserInfo {
  final String name;
  final String email;
  final String firstName;
  final String dadLastName;
  final String momLastName;
  final int age;
  final String city;
  final String ci;

  UserInfo({
    required this.name,
    required this.email,
    required this.firstName,
    required this.dadLastName,
    required this.momLastName,
    required this.age,
    required this.city,
    required this.ci,
  });
}

class UserResponse extends UserInfo {
  final int id;

  UserResponse({
    required this.id,
    required super.name,
    required super.email,
    required super.firstName,
    required super.dadLastName,
    required super.momLastName,
    required super.age,
    required super.city,
    required super.ci,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email' : email,
      'firstName': firstName,
      'dadLastName': dadLastName,
      'momLastName': momLastName,
      'age': age,
      'city' : city,
      'ci' : ci
    };
  }
}
