import 'package:firebase_demo/Routes/routes_name.dart';
import 'package:firebase_demo/View/AuthScreens/login_screen.dart';
import 'package:firebase_demo/View/AuthScreens/sign_up_screen.dart';
import 'package:firebase_demo/View/HomeScreens/home_screen.dart';
import 'package:firebase_demo/View/splash_screen.dart';
import 'package:get/get.dart';

import '../View/EditProfileScreens/edit_profile_screen.dart';

class GoRoutes {
  static final List<GetPage> goRoutes = [
    GetPage(
      name: RoutesName.SplashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesName.LoginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RoutesName.SignUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(name: RoutesName.HomeScreen, page: () => const HomeScreen()),
    GetPage(
        name: RoutesName.EditProfileScreen,
        page: () => const EditProfileScreen()),
  ];
}
