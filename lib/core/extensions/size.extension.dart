import 'package:flutter/material.dart';

import '../../main.dart';

extension MediaQueryValues on BuildContext {

  double get screenWidth =>
      MediaQuery
          .of(navigatorKey.currentContext!).size.width*0.25;


  double get screenHeight =>
      MediaQuery
          .of(navigatorKey.currentContext!).size.height*0.25;


}