import 'package:app_missing/domain/entities/missing.dart';

import '../../domain/entities/user.dart';

final defaultUserResponse = UserResponse(
  id: 1,
  name: 'name',
  email: 'email',
  firstName: 'firstName',
  dadLastName: 'dadLastName',
  momLastName: 'momLastName',
  age: 12,
  city: 'city',
  ci: 'ci',
);

final defaultMissingDetail = MissingDetail(
  id: 0,
  birthDate: DateTime.now(),
  missingDate: DateTime.now(),
  fullName: 'Nueva persona desaparecida',
  size: 0,
  gender: true,
  description: '',
  lastSeenMap: '',
  found: false,
  photosFront: false,
  photosLeft: false,
  photosRigth: false,
);

final List<String> monthsDefault = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre',
];
