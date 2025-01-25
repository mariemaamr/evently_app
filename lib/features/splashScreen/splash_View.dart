import 'dart:async';
import 'package:evently/core/appAssets.dart';
import 'package:evently/core/constant/services/local_storage_keys.dart';
import 'package:evently/core/constant/services/local_storage_service.dart';
import 'package:evently/core/routes/pages_route_name.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
          () {
        bool isFirstTime = LocalStorage.getBool(LocalStorageKeys.isFirstTime) ?? true;
        Navigator.pushReplacementNamed(
          context,
          isFirstTime ? PagesRouteName.onBoarding : PagesRouteName.signIn,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppAssets.splashLogo,
              width: 200,
              height: 240,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.splashBranding,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
