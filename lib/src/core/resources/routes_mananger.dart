// import 'package:drosak/src/view/Forgot%20Password/screen/forgot_password_screen.dart';
import 'package:drosak/src/view/forget_password/screen/forget_password.dart';
import 'package:drosak/src/view/login_screen/screen/login_screen.dart';
import 'package:drosak/src/view/main_screen/screen/main_screen.dart';
import 'package:drosak/src/view/on_boarding/screen/on_boarding_screen.dart';
import 'package:drosak/src/view/register_screen/screen/register_screen.dart';
// import 'package:drosak/src/view/home_screen/screen/home_screen.dart';
// import 'package:drosak/src/view/login_screen/screen/login_screen.dart';
// import 'package:drosak/src/view/register_screen/screen/register_screen.dart';
import 'package:drosak/src/view/splash_screen/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class RoutesManager {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.kSplashScreenRoute: (context) => const SplashScreen(),
    RoutesName.kOnBoardingScreenRoute: (context) => const OnBoardingScreen(),
    RoutesName.kMainScreenRoute: (context) => const MainScreen(),
    RoutesName.kLoginScreenRoute: (context) => LoginScreen(),
    RoutesName.kRegisterScreenRoute: (context) => const RegisterScreen(),
    RoutesName.kForgotPasswordScreenRoute: (context) =>
        const ForgotPasswordScreen(),
  };
}

class RoutesName {
  static const String kSplashScreenRoute = '/kSplashScreenRoute';
  static const String kOnBoardingScreenRoute = '/kOnBoardingScreenRoute';
  static const String kMainScreenRoute = '/kMainScreenRoute';
  static const String kLoginScreenRoute = '/kLoginScreenRoute';
  static const String kRegisterScreenRoute = '/kRegisterScreenRoute';
  static const String kForgotPasswordScreenRoute =
      '/kForgotPasswordScreenRoute';
}
