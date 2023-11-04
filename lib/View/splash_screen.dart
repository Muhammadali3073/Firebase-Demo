import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    nextScreenRoute();
    super.initState();
  }

  nextScreenRoute() async {
    // Check Login or Not
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    bool isLogin = false;
    isLogin = prefs.getBool('isLogin') ?? false;
    log('isLogin $isLogin');
    // End Check Login or Not

    Future.delayed(
      const Duration(seconds: 3),
      () => isLogin == false
          ? Get.offAllNamed(RoutesName.LoginScreen)
          : Get.offAllNamed(RoutesName.HomeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Text('Firebase Task',
            style: TextStyle(fontSize: 25.sp, color: Colors.white)),
      ),
    );
  }
}
