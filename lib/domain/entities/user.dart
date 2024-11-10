
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
    required String name,
    required String email,
    required String firstName,
    required String dadLastName,
    required String momLastName,
    required int age,
    required String city,
    required String ci,
  }) : super(
          name: '',
          email: '',
          firstName: '',
          dadLastName: '',
          momLastName: '',
          age: 0,
          city: '',
          ci: '',
        );
}
