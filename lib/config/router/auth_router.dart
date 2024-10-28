import 'package:app_missing/pages/auth/login_page.dart';
import 'package:go_router/go_router.dart';

const String pathBase = "/auth";

final List<GoRoute> authRoutes = [
  GoRoute(
    path: '$pathBase/login',
    name: LoginPage.name,
    builder: (context, state) => const LoginPage(),
  ),
  // GoRoute(
  //   path: '$pathBase/register',
  //   name: RegistrationPage.name,
  //   builder: (context, state) => const RegistrationPage(),
  // ),
];
