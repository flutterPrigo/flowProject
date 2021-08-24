import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xr_dumy/Screen/HomeScreen/HomeScreen.dart';
import 'package:xr_dumy/Screen/RegisterScreen/RegisterController.dart';
import 'package:xr_dumy/Widget/CustomButton.dart';
import 'package:xr_dumy/Widget/CustomTextFormField.dart';
import 'package:sizer/sizer.dart';
import 'package:xr_dumy/theme/app_color.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/registerScreen';

  RegisterController _registerController = Get.put(RegisterController());

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
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColor.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Form(
                    key: _registerController.formRegisterKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          obscureText: false,
                          onChanged: (val) {},
                          controller: _registerController.emailController,
                          labelText: 'Email',
                          hintText: 'Email',
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          obscureText: true,
                          onChanged: (val) {},
                          controller: _registerController.passwordController,
                          labelText: 'Password',
                          hintText: 'Password',
                        ),
                        SizedBox(height: 56.h),
                        InkWell(
                          onTap: (){
                            _registerController.userRegister();
                          },
                          child: CustomButton(name: 'REGISTER'),
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
