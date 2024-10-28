import 'package:app_missing/config/router/auth_router.dart';
import 'package:app_missing/config/router/home_router.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/auth/login',
  routes: [
    ...authRoutes,
    ...homeRoutes,
  ],
);
