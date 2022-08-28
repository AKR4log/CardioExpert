import 'package:flutter/material.dart';

import '../../ui/mobile/splash.dart';
import 'custom_anim.dart';

class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => const SplashPage(),
    };
  }

  static SlideLeftRoute<bool> onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      // case "LoginPage":
      //   return SlideLeftRoute<bool>(
      //       builder: (BuildContext context) => LoginPage());
      // case "HomePage":
      //   return SlideLeftRoute<bool>(
      //       builder: (BuildContext context) => const HomePage());
      // case "RegisterPage":
      //   return SlideLeftRoute<bool>(
      //       builder: (BuildContext context) => const RegisterPage());
      // case "WorkshopComplait":
      //   return SlideLeftRoute<bool>(
      //       builder: (BuildContext context) => const WorkshopComplait());
      // case "WorkshopApplication":
      //   return SlideLeftRoute<bool>(
      //       builder: (BuildContext context) => const WorkshopApplication());

      // case "ComfirmCodePrivate":
      //   String verificationID = pathElements[2];
      //   return SlideLeftRoute<bool>(
      //       builder: (BuildContext context) =>
      //           ComfirmCodePrivate(verificationID: verificationID));
      //   break;
    }
  }
}
