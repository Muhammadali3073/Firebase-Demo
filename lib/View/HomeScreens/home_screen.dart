import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Controllers/get_user_data_controller.dart';
import '../../Controllers/sign_in_view_controller.dart';
import '../../Routes/routes_name.dart';
import '../Widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController(), tag: 'getUserDataController');
  SignInController signInController =
      Get.put(SignInController(), tag: 'signInController');

  // Call User Data to Home Screen when user already login
  getUserDataMethod() {
    if (getUserDataController.getUserDataRxModel.value == null) {
      getUserDataController.getUserData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserDataMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Home Screen',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.deepPurple),
        body: Container(
          width: 100.w,
          height: 100.h,
          color: Colors.white,
          child: getUserDataController.isGetUserDataLoading.value
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.deepPurple),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getCustomTextW6S18(
                              text: 'Show User Data',
                              color: Colors.black,
                            ),
                            getVerSpace(2.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomTextW6S16(
                                  text: 'Your Name:',
                                  color: Colors.black,
                                ),
                                getCustomTextS16(
                                    text: getUserDataController
                                        .getUserDataRxModel.value!.fullName
                                        .toString(),
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomTextW6S16(
                                  text: 'Your Age:',
                                  color: Colors.black,
                                ),
                                getCustomTextS16(
                                    text: getUserDataController
                                        .getUserDataRxModel.value!.age
                                        .toString(),
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomTextW6S16(
                                  text: 'Your Company:',
                                  color: Colors.black,
                                ),
                                getCustomTextS16(
                                    text: getUserDataController
                                        .getUserDataRxModel.value!.company
                                        .toString(),
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomTextW6S16(
                                  text: 'Your City:',
                                  color: Colors.black,
                                ),
                                getCustomTextS16(
                                    text: getUserDataController
                                        .getUserDataRxModel.value!.city
                                        .toString(),
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomTextW6S16(
                                  text: 'Your Email:',
                                  color: Colors.black,
                                ),
                                getCustomTextS16(
                                    text: getUserDataController
                                        .getUserDataRxModel.value!.email
                                        .toString(),
                                    color: Colors.black),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesName.EditProfileScreen);
                                },
                                child: fillColorButton(
                                    text: 'Go for Edit Profile',
                                    )),
                            getVerSpace(2.h),
                            InkWell(
                                onTap: () {
                                  signInController.signOutHandler();
                                },
                                child: fillColorButton(
                                    text: 'Sign Out',
                                    color: Colors.red,
                                    loading: signInController
                                        .isSignOutLoading.value)),
                          ],
                        )
                      ]),
                ),
        ),
      ),
    );
  }
}
