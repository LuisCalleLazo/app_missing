import 'package:app_missing/config/router/app_router.dart';
import 'package:app_missing/config/theme/app_theme.dart';
import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/provider/missing/notification_provider.dart';
import 'package:app_missing/presentation/provider/video/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:app_missing/presentation/provider/auth/auth_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VideoProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MissingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MisPeo',
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
