import 'package:app_missing/presentation/pages/app/home_page.dart';
import 'package:app_missing/shared/constants/storage_value.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

const String pathBase = "/home";

final List<GoRoute> homeRoutes = [
  GoRoute(
    path: pathBase,
    name: HomePage.name,
    builder: (context, state) => const HomePage(),
    redirect: (context, state) {
      const storage = FlutterSecureStorage();
      final token = storage.read(key: StorageKey.getCurrentToken());
      if (token == null) {
        return '/login';
      }
      return null;
    },
  ),
];
