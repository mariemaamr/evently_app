 import 'package:evently/core/routes/pages_route_name.dart';
import 'package:evently/features/createEvent/create_event_screen.dart';
import 'package:evently/features/eventMap/event_map.dart';
import 'package:evently/features/forgetPassword/forgetpassword.dart';
import 'package:evently/features/signIn/sign_in_view.dart';
import 'package:evently/features/signUp/sign_up_view.dart';
import 'package:evently/features/splashScreen/splash_View.dart';
import 'package:flutter/material.dart';

import '../../features/homeScreen/homeScreen.dart';
import '../../features/onBoardingScreens/on_Boarding_Screens.dart';

abstract class AppRoutes{
  static Route onGeneratedRoute(RouteSettings settings){
    switch(settings.name){
      case PagesRouteName.initial:
        return MaterialPageRoute(builder:(context) => SplashView(),
    settings: settings
        );

      case PagesRouteName.onBoarding:
        return MaterialPageRoute(builder:(context) => OnboardingScreen(),
            settings: settings
        );

      case PagesRouteName.signIn:
        return MaterialPageRoute(builder:(context) => SignInView(),
            settings: settings
        );

        case PagesRouteName.signUp:
        return MaterialPageRoute(builder:(context) => SignUpView(),
            settings: settings
        );
      case PagesRouteName.forgetPassword:
        return MaterialPageRoute(builder:(context) => ForgetPasswordView(),
            settings: settings
        );
      case PagesRouteName.homeScreen:
        return MaterialPageRoute(builder:(context) => HomeScreen(),
            settings: settings
        );
      case PagesRouteName.createEvent:
        return MaterialPageRoute(
            builder: (context) => CreateEvent(), settings: settings);
      case PagesRouteName.eventMap:
        return MaterialPageRoute(
            builder: (context) => EventMap(), settings: settings);

      default:
        return MaterialPageRoute(builder:(context) => SplashView(),
            settings: settings
        );

    }
  }
}