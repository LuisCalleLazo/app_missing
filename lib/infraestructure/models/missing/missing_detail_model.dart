import 'package:app_missing/domain/entities/missing.dart';

class MissingDetailModel extends MissingDetail {
  MissingDetailModel(
      {required super.id,
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
      required super.photosRigth});

  factory MissingDetailModel.toModel(MissingDetail object) {
    return MissingDetailModel(
      id: object.id,
      birthDate: object.birthDate,
      missingDate: object.missingDate,
      fullName: object.fullName,
      size: object.size,
      gender: object.gender,
      description: object.description,
      lastSeenMap: object.lastSeenMap,
      found: object.found,
      photosFront: object.photosFront,
      photosLeft: object.photosLeft,
      photosRigth: object.photosRigth,
    );
  }

  factory MissingDetailModel.fromJson(Map<String, dynamic> json) {
    return MissingDetailModel(
      id: json['id'] ?? 0,
      birthDate: DateTime.parse(json['birthDate']),
      missingDate: DateTime.parse(json['missingDate']),
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
      'id': id,
      'birthDate': birthDate.toUtc().toIso8601String(),
      'missingDate': missingDate.toUtc().toIso8601String(),
      'fullName': fullName,
      'size': size,
      'gender': gender,
      'description': description,
      'lastSeenMap': lastSeenMap,
      'found': found,
      'photosFront': photosFront,
      'photosLeft': photosLeft,
      'photosRigth': photosRigth,
    };
  }
}
