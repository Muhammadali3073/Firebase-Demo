import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes/routes_name.dart';
import '../Utils/Validations/validations.dart';
import 'get_user_data_view_model.dart';

class SignInController extends GetxController {
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController(), tag: 'getUserDataController');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isSignInLoading = false.obs;
  var isSignOutLoading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;

  signInHandler({userEmail, userPassword}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      isSignInLoading.value = true;

      final userCredential = await auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);

      final User user = userCredential.user!;

      if (user.toString().isNotEmpty) {
        await prefs.setBool('isLogin', true);
        getUserDataController.getUserData(userId: user.uid);

        Get.offAllNamed(RoutesName.HomeScreen);
        isSignInLoading.value = false;
        log('Login Successfully');
        log('Login: ${prefs.getBool('isLogin')} ');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', Validations.handleFirebaseAuthError(e.toString()));
      isSignInLoading.value = false;
    }
  }

  signOutHandler() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isSignOutLoading.value = true;
      await auth.signOut().then(
        (value) async {
          await prefs.remove('isLogin');
          Get.offAllNamed(RoutesName.LoginScreen);
          Get.snackbar('Success', 'Signout Successfully.');
          log('Signout Successfully.');
          isSignOutLoading.value = false;
        },
      );
    } catch (e) {
      Get.snackbar('Error', Validations.handleFirebaseAuthError(e.toString()));
      log(e.toString());
      isSignOutLoading.value = false;
    }
  }
}
