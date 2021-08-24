import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:xr_dumy/Controller/Authentication.dart';
import 'package:xr_dumy/Screen/LoginScreen/LoginScreen.dart';
import 'package:xr_dumy/Screen/SecondScreen/SecondScreen.dart';

import 'Screen/HomeScreen/HomeScreen.dart';
import 'Screen/RegisterScreen/RegisterScreen.dart';
import 'Screen/Splash_Scareen.dart';

void main() async {
  await GetStorage.init();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          title: 'xr Demo',
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
            GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
            GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
            GetPage(name: RegisterScreen.routeName, page: () => RegisterScreen()),
            GetPage(name: SecondScreen.routeName, page: () => SecondScreen()),
          ],
          initialRoute: SplashScreen.routeName,
          initialBinding: AuthBinding(),
        );
      },
    );
  }
}

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Authentication());
  }
}
