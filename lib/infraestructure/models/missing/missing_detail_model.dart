import 'package:app_missing/domain/entities/missing.dart';

class MissingDetailModel extends MissingDetail {
  MissingDetailModel({
  required super.id,
  required super.birthDate,
  required super.missingDate,
  required super.fullName,
  required super.size,
  required super.gender,
  required super.description,
  required super.lastSeenMap,
  required super.found,
  required super.photosFront,
  required super.photosLeft,
  required super.photosRigth
  });

  factory MissingDetailModel.fromJson(Map<String, dynamic> json) {
    return MissingDetailModel(
      id: json['id'] ?? 0,
      birthDate: DateTime.parse(json['birthDate']),
      missingDate:  DateTime.parse(json['missingDate']),
      fullName: json['fullName'] ?? '',
      size: json['size'] ?? 0,
      gender: json['gender'] ?? false,
      description: json['description'] ?? '',
      lastSeenMap: json['lastSeenMap'] ?? '',
      found: json['found'] ?? false,
      photosFront: json['photosFront'] ?? false,
      photosLeft: json['photosLeft'] ?? false,
      photosRigth: json['photosRigth'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'birthDate' : birthDate,
      'missingDate' : missingDate,
      'fullName' : fullName,
      'size' : size,
      'gender' : gender,
      'description' : description,
      'lastSeenMap' : lastSeenMap,
      'found' : found,
      'photosFront' : photosFront,
      'photosLeft' : photosLeft,
      'photosRigth' : photosRigth,
    };
  }
}
