// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/users_model.dart';
import '../Routes/routes_name.dart';
import '../Utils/Validations/validations.dart';

class SignupController extends GetxController {
  // TextEditingController for SignUp Field
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isSignUpLoading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Set Fire-store date to Model
  final userData = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (users, _) => users.toJson(),
      );

  // Sign Up Method
  signUpHandler({
    fullName,
    age,
    company,
    city,
    email,
    password,
  }) async {
    try {
      isSignUpLoading.value = true;

      // Create User With Email And Password
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Get User from userCredential
      final User user = userCredential.user!;

      // Add User and Check User not Empty
      if (user.toString().isNotEmpty) {
        addUser(
          user.uid,
          fullName: fullName,
          age: age,
          company: company,
          city: city,
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', Validations.handleFirebaseAuthError(e.toString()));
      isSignUpLoading.value = false;
    }
  }

  // Add user data in fire-store
  Future<void> addUser(
    userID, {
    fullName,
    age,
    company,
    city,
    email,
    password,
  }) async {
    return await userData
        .doc(userID)
        .set(UserModel(
            userId: userID,
            fullName: fullName,
            age: age,
            company: company,
            city: city,
            email: email,
            password: password))
        .then(
      (value) {
        Get.snackbar('Success', 'User Registered Successfully.');
        Get.offAllNamed(RoutesName.LoginScreen);
        isSignUpLoading.value = false;
        log("User Added");
      },
    ).catchError((error) {
      isSignUpLoading.value = false;
      log("Failed to add user: $error");
    });
  }
}
