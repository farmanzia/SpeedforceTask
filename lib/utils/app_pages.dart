import 'package:get/get.dart';
import 'package:speedforcetest/utils/appRoutes.dart';
import 'package:speedforcetest/view/home.dart';
import 'package:speedforcetest/view/landing.dart';
import 'package:speedforcetest/view/login.dart';
import 'package:speedforcetest/view/sign_up.dart';
import 'package:speedforcetest/view/splashScreen.dart';

List<GetPage<dynamic>>? appPages =[
  GetPage(name: AppRoutes.splash, page:()=> const Splashscreen()),
  GetPage(name: AppRoutes.login, page:()=> const Login()),
  GetPage(name: AppRoutes.signup, page:()=> const SignUp()),
  GetPage(name: AppRoutes.home, page:()=> const Landing()),
  GetPage(name: AppRoutes.home, page:()=> const Home())
];