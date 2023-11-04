import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ViewModel/edit_profile_view_model.dart';
import '../Widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController =
      Get.put(EditProfileController(), tag: 'editProfileController');
  final formKey = GlobalKey<FormState>();
  var isShowPassword = true.obs;

  @override
  Widget build(BuildContext context) {
    editProfileController.fullNameController.text = editProfileController
        .getUserDataController.getUserDataRxModel.value!.fullName
        .toString();
    editProfileController.ageController.text = editProfileController
        .getUserDataController.getUserDataRxModel.value!.age
        .toString();
    editProfileController.companyController.text = editProfileController
        .getUserDataController.getUserDataRxModel.value!.company
        .toString();
    editProfileController.cityController.text = editProfileController
        .getUserDataController.getUserDataRxModel.value!.city
        .toString();

    return Obx(
      () => Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.white),
              ),
              centerTitle: true,
              title: const Text('Edit Profile Screen',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.deepPurple),
          body: SingleChildScrollView(
            child: Container(
              width: 100.w,
              height: 100.h,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 3.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomTextW6S14(
                        text: 'Full Name',
                        color: Colors.black,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        hintText: 'Enter Your Name',
                        controller: editProfileController.fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name not be empty!";
                          } else {
                            return null;
                          }
                        },
                      ),
                      getVerSpace(1.2.h),
                      getCustomTextW6S14(
                        text: 'Age',
                        color: Colors.black,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        hintText: 'Enter Your Age',
                        controller: editProfileController.ageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Age not be empty!";
                          } else {
                            return null;
                          }
                        },
                      ),
                      getVerSpace(1.2.h),
                      getCustomTextW6S14(
                        text: 'Company',
                        color: Colors.black,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        hintText: 'Enter Your Company',
                        controller: editProfileController.companyController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Company not be empty!";
                          } else {
                            return null;
                          }
                        },
                      ),
                      getVerSpace(1.2.h),
                      getCustomTextW6S14(
                        text: 'City',
                        color: Colors.black,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.streetAddress,
                        obscureText: false,
                        hintText: 'Enter Your City',
                        controller: editProfileController.cityController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "City not be empty!";
                          } else {
                            return null;
                          }
                        },
                      ),
                      getVerSpace(3.h),
                      InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              editProfileController.updateUserData(
                                fullName: editProfileController
                                    .fullNameController.text
                                    .trim(),
                                age: editProfileController.ageController.text
                                    .trim(),
                                company: editProfileController
                                    .companyController.text
                                    .trim(),
                                city: editProfileController.cityController.text
                                    .trim(),
                              );
                            }
                          },
                          child: fillColorButton(
                              text: 'Save',
                              loading: editProfileController.isUpdateProfileLoading.value)),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
