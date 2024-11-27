import 'package:app_missing/domain/entities/missing.dart';

class MissingListSingleModal extends MissingListSingle {
  MissingListSingleModal({
    required super.id,
    required super.fullName,
  });

  factory MissingListSingleModal.toModel(MissingDetail object) {
    return MissingListSingleModal(
      id: object.id,
      fullName: object.fullName,
    );
  }

  factory MissingListSingleModal.fromJson(Map<String, dynamic> json) {
    return MissingListSingleModal(
      id: json['id'] ?? 0,
      fullName: json['fullName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
    };
  }
}
