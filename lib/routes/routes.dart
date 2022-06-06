

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shoping_f/bindings/mainBindings.dart';
import 'package:shoping_f/controller/mainscreen_controller.dart';
import 'package:shoping_f/view/sereen/auth/login_screen.dart';

import '../bindings/auth_bindings.dart';
import '../bindings/product_bindings.dart';
import '../view/sereen/auth/forget_password_secreen.dart';
import '../view/sereen/auth/signup_screen.dart';
import '../view/sereen/cards/card_Screen.dart';
import '../view/sereen/main_screen.dart';
import '../view/sereen/welcome_sereen.dart';


class AppRoutes{
  static const Welcome= Namepages.WelcomeScreen;

  static final routes=[
    GetPage(name: Welcome, page: ()=> WelcomeScreen()),
    GetPage(name: Namepages.LoginScreen1, page: ()=> LoginScreen(),binding: AuthBindings()),
    GetPage(name: Namepages.SignUpScreen, page: ()=> SignUpScreen(),binding: AuthBindings()),
    GetPage(name: Namepages.ForgetPassword, page: ()=> ForgetPassword(),binding: AuthBindings()),
    GetPage(name: Namepages.MainScreen, page: ()=> MainScreen(),bindings: [
      AuthBindings(), MainBindings(),ProductBindings(),
    ]),
    GetPage(name: Namepages.CardScreen, page: ()=> CardScreen(),),
  ];


}
class Namepages{
  static const WelcomeScreen='/WelcomeScreen';
  static const LoginScreen1='/LoginScreen';
  static const SignUpScreen='/SignUpScreen';
  static const ForgetPassword='/ForgetPassword';
  static const MainScreen='/MainScreen';
  static const CardScreen='/CardScreen';

}