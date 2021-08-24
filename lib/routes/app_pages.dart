import 'app_routes.dart';
import '../views/pages/pages.dart';
import 'package:flutter/cupertino.dart';

class AppPage {
  Map<String, Widget Function(BuildContext)> pages = {
    AppRoutes.mainPage: (context) => MainPage(),
    AppRoutes.homePage: (context) => HomePage(),
    AppRoutes.bonusPage: (context) => BonusPage(),
    AppRoutes.detailPage: (context) => DetailPage(),
    AppRoutes.splashPage: (context) => SplashPage(),
    AppRoutes.signInPage: (context) => SignInPage(),
    AppRoutes.signUpPage: (context) => SignUpPage(),
    AppRoutes.checkoutPage: (context) => CheckoutPage(),
    AppRoutes.getStartedPage: (context) => GetStartedPage(),
    AppRoutes.chooseSeatPage: (context) => ChooseSeatPage(),
  };
}
