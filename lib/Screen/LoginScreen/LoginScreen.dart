import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xr_dumy/Screen/HomeScreen/HomeScreen.dart';
import 'package:xr_dumy/Screen/LoginScreen/LoginController.dart';
import 'package:xr_dumy/Screen/RegisterScreen/RegisterScreen.dart';
import 'package:xr_dumy/Widget/CustomButton.dart';
import 'package:xr_dumy/Widget/CustomTextFormField.dart';
import 'package:xr_dumy/theme/app_color.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginScreen';

  final LoginScreenController _loginScreenController =
      Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColor.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Form(
                    key: _loginScreenController.formLoginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextFormField(
                          controller: _loginScreenController.emailController,
                          hintText: 'Email',
                          labelText: 'Email',
                          obscureText: false,
                          onChanged: (val) {
                            log(_loginScreenController.emailController.text);
                          },
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: _loginScreenController.passwordController,
                          hintText: 'Password',
                          labelText: 'Password',
                          obscureText: true,
                          onChanged: (val) {
                            log(_loginScreenController.passwordController.text);
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            'Register Here',
                            style: TextStyle(
                              fontSize:10.sp,
                              color: AppColor.red,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAndToNamed(HomeScreen.routeName);
                          },
                          child: CustomButton(name: 'LOGIN'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
