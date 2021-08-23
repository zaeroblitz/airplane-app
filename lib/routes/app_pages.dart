import 'app_routes.dart';
import '../views/pages/pages.dart';
import 'package:flutter/cupertino.dart';

class AppPage {
  Map<String, Widget Function(BuildContext)> pages = {
    AppRoutes.splashPage: (context) => SplashPage(),
    AppRoutes.getStartedPage: (context) => GetStartedPage(),
    AppRoutes.signUpPage: (context) => SignUpPage(),
    AppRoutes.signInPage: (context) => SignInPage(),
    AppRoutes.bounsPage: (context) => BonusPage(),
  };
}
