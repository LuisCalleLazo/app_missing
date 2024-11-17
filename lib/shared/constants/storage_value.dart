import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageKey {
  static String getCurrentToken() => "currentToken";
  static String getRefreshToken() => "refreshToken";
  static String getUser() => "user";
}

class StorageDirection {
  static Future<String> getDirPhotosMissing() async {
    final directory = await getTemporaryDirectory();
    String path = "${directory.path}/fiver_bob_photos";
    final photosDir = Directory(path);
    if (!await photosDir.exists()) {
      // Si el directorio no existe, lo crea
      await photosDir.create(recursive: true);
    }
    return path;
  }
}
