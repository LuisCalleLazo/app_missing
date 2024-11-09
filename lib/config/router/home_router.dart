
import 'package:app_missing/presentation/pages/app/home_page.dart';
import 'package:go_router/go_router.dart';

const String pathBase = "/home";


final List<GoRoute> homeRoutes = [
  GoRoute(
    path: pathBase,
    name: HomePage.name,
    builder: (context, state) => const HomePage(),
  ),
];
