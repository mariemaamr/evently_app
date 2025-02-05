import 'package:bot_toast/bot_toast.dart';
import 'package:evently/core/constant/services/local_storage_service.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/services/easy_loading_serv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

var navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalStorage.init();
  runApp(const MyApp());
  configloading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}