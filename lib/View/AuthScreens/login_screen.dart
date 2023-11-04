import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_demo/View/Widgets/widgets.dart';
import 'package:firebase_demo/ViewModel/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignInController signInController =
      Get.put(SignInController(), tag: 'signInController');
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
              centerTitle: true,
              title: const Text('Login Screen',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.deepPurple),
          body: Container(
            width: 100.w,
            height: 100.h,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 3.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomTextW6S14(
                      text: 'Email',
                      color: Colors.black,
                    ),
                    getVerSpace(0.7.h),
                    getCustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      hintText: 'Enter Your Email',
                      controller: signInController.emailController,
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
                      controller: signInController.passwordController,
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
                            signInController.signInHandler(
                              userEmail:
                                  signInController.emailController.text.trim(),
                              userPassword: signInController
                                  .passwordController.text
                                  .trim(),
                            );
                          }
                        },
                        child: fillColorButton(
                            text: 'Login',
                            loading: signInController.isSignInLoading.value)),
                    getVerSpace(2.h),
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => Get.toNamed(RoutesName.SignUpScreen),
                          child: getCustomTextW6S14(
                              text: 'Don’t have an account? Sign Up'),
                        ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
