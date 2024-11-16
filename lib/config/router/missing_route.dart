import 'package:app_missing/presentation/pages/missing/missing_detail_page.dart';
import 'package:app_missing/presentation/pages/missing/missing_photos_page.dart';
import 'package:app_missing/shared/constants/storage_value.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

const String pathBase = "/missing";

final List<GoRoute> missingRoutes = [
  GoRoute(
    path: '$pathBase/detail',
    name: MissingDetailPage.name,
    builder: (context, state) => const MissingDetailPage(),
    redirect: (context, state) {
      const storage = FlutterSecureStorage();
      final token = storage.read(key: StorageKey.getCurrentToken());
      if (token == null) {
        return '/login';
      }
      return null;
    },
  ),
  GoRoute(
    path: '$pathBase/photos',
    name: MissingPhotosPage.name,
    builder: (context, state) => const MissingPhotosPage(),
    redirect: (context, state) {
      const storage = FlutterSecureStorage();
      final token = storage.read(key: StorageKey.getCurrentToken());

      if (token == null) return '/login';

      return null;
    },
  ),
];
