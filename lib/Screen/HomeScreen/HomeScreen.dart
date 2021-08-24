import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xr_dumy/Screen/HomeScreen/HomeController.dart';
import 'package:xr_dumy/Screen/LoginScreen/LoginScreen.dart';
import 'package:xr_dumy/Screen/SecondScreen/SecondScreen.dart';
import 'package:xr_dumy/Widget/CustomTextFormField.dart';
import 'package:xr_dumy/helper/SharePreference.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homeScreen';

  final HomeController _homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
                obscureText: false,
                onChanged: (val) {},
                controller: _homeController.passController,
                labelText: 'name',
                hintText: 'name'),
            Text(
              'Home Page',
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () {
                SharedPreference.clear();
                log(SharedPreference.userName.toString());
                log(SharedPreference.password.toString());
                // Get.offAndToNamed(LoginScreen.routeName);

                Get.toNamed(SecondScreen.routeName);
              },
              child: Text('Clear Data'),
            ),
          ],
        ),
      ),
    );
  }
}
