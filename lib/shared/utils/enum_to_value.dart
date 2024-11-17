import 'package:app_missing/shared/utils/types.dart';

extension MissingPhotosTypeExtension on MissingPhotosType {
  String localizedText(String languageCode) {
    final translations = {
      'es': {
        MissingPhotosType.front: "frontal",
        MissingPhotosType.left: "izquierda",
        MissingPhotosType.rigth: "derecha",
      },
    };
    return translations[languageCode]?[this] ?? "Unknown";
  }
}
