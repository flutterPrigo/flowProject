import 'package:flutter/material.dart';
import 'package:xr_dumy/theme/app_color.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final Function(String?) onChanged;
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const CustomTextFormField(
      {required this.obscureText,
      required this.onChanged,
      required this.controller,
      required this.labelText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.appColors),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.appColors),
        ),
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColor.appColors,
        ),
      ),
      style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none),
      cursorColor: AppColor.appColors,
      cursorWidth: 1,
      // validator: validator,
    );
  }
}
