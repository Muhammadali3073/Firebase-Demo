import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_user_data_controller.dart';

class EditProfileController extends GetxController {
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController(), tag: 'getUserDataController');

  // EditProfileScreen TextEditing Controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  var isUpdateProfileLoading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;

  // Update Profile Handler
  updateProfileHandler({
    fullName,
    age,
    company,
    city,
  }) async {
    try {
      updateUserData(
          fullName: fullName, age: age, company: company, city: city);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.toString());
      isUpdateProfileLoading.value = false;
    }
  }

  // Add user data in fire-store
  updateUserData({
    fullName,
    age,
    company,
    city,
  }) async {
    isUpdateProfileLoading.value = true;
    log(isUpdateProfileLoading.value.toString());
    final dataToUpdate = {
      'fullName': fullName,
      'age': age,
      'company': company,
      'city': city,
    };

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(dataToUpdate)
        .then(
      (value) {
        // Call Get user controller
        getUserDataController.getUserData();
        isUpdateProfileLoading.value = false;
        Get.snackbar('Success', 'User Update Successfully.');
        // Get.offAllNamed(RoutesName.HomeScreen);
        log("User Updated");
      },
    ).catchError((error) {
      isUpdateProfileLoading.value = false;
      log("Failed to add user: $error");
    });
  }
}
