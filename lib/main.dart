import 'package:evently/core/constant/services/local_storage_service.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/themes/app_theme_manager.dart';
import 'package:evently/features/homeScreen/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      navigatorKey: navigatorKey,
    );
  }
}
