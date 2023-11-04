import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ViewModel/sign_up_view_model.dart';
import '../Widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignupController signupController =
      Get.put(SignupController(), tag: 'signupController');
  final formKey = GlobalKey<FormState>();
  var isShowPassword = true.obs;

  @override
  Widget build(BuildContext context) {
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
              title: const Text('SignUp Screen',
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
                        controller: signupController.fullNameController,
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
                        controller: signupController.ageController,
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
                        controller: signupController.companyController,
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
                        controller: signupController.cityController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "City not be empty!";
                          } else {
                            return null;
                          }
                        },
                      ),
                      getVerSpace(1.2.h),
                      getCustomTextW6S14(
                        text: 'Email',
                        color: Colors.black,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        hintText: 'Enter Your Email',
                        controller: signupController.emailController,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a valid email",
                      ),
                      getVerSpace(1.2.h),
                      getCustomTextW6S14(
                        text: 'Password',
                        color: Colors.black,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isShowPassword.value,
                        controller: signupController.passwordController,
                        hintText: 'Enter Your Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password not be empty!";
                          } else if (value.length <= 4) {
                            return "Password must be greater than 5 character!";
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isShowPassword.value = !isShowPassword.value;
                            },
                            child: isShowPassword.value
                                ? Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.black,
                                    size: 20.px,
                                  )
                                : Icon(
                                    Icons.password,
                                    color: Colors.black,
                                    size: 20.px,
                                  )),
                      ),
                      getVerSpace(3.h),
                      InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              signupController.signUpHandler(
                                fullName: signupController
                                    .fullNameController.text
                                    .trim(),
                                age: signupController.ageController.text.trim(),
                                company: signupController.companyController.text
                                    .trim(),
                                city:
                                    signupController.cityController.text.trim(),
                                email: signupController.emailController.text
                                    .trim(),
                                password: signupController
                                    .passwordController.text
                                    .trim(),
                              );
                            }
                          },
                          child: fillColorButton(
                              text: 'Sign Up',
                              loading: signupController.isSignUpLoading.value)),
                      getVerSpace(2.h),
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: getCustomTextW6S14(
                                text: 'Already have account?  Login'),
                          ))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
