class MissingDetail {
  final int id;
  final DateTime birthDate;
  final DateTime missingDate;
  final String fullName;
  final double size;
  final bool gender;
  final String description;
  final String lastSeenMap;
  final bool found;
  bool photosFront;
  bool photosLeft;
  bool photosRigth;

  MissingDetail(
      {required this.id,
      required this.birthDate,
      required this.missingDate,
      required this.fullName,
      required this.size,
      required this.gender,
      required this.description,
      required this.lastSeenMap,
      required this.found,
      required this.photosFront,
      required this.photosLeft,
      required this.photosRigth});
}

class MissingListSingle {
  final int id;
  final String fullName;

  MissingListSingle({
    required this.id,
    required this.fullName,
  });
}
