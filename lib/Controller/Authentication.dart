import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:xr_dumy/Model/Users.dart';
import 'package:xr_dumy/Screen/HomeScreen/HomeScreen.dart';
import 'package:xr_dumy/Screen/LoginScreen/LoginScreen.dart';
import 'package:xr_dumy/helper/SharePreference.dart';
import 'package:xr_dumy/helper/network_helper.dart';

class Authentication extends GetxController {
  static final NetworkAPI _networkAPI = NetworkAPI();
  DateTime? currentTime;
  late UserData userData;

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 2), () {
      checkLogin();
    });
  }

  Future<void> userRegister({
    required String email,
    required String password,
  }) async {
    try {
      final registerDetails = {
        'email': email,
        'password': password,
      };
      Get.back();

      _networkAPI.post('uri/register', json.encode(registerDetails));

      return;
    } catch (e) {
      // AppSharedPreference.clear();
      log(e.toString());
    }
  }

  Future<UserData> login(String _userName, String _password) async {
    try {
      final loginBody = {
        "username": _userName,
        "password": _password,
      };

      SharedPreference.setUserName(_userName);
      SharedPreference.setPass(_password);

      final String? name = SharedPreference.userName;
      final String? pass = SharedPreference.password;
      log('name name ===== $name');
      log('name name ===== $pass');

      Get.offAllNamed(HomeScreen.routeName);

      final result = await _networkAPI.post(
          'user/login', json.encode(loginBody),
          header: {'Content-Type': 'application/json'});
      result['data']['token'] = result['token'];


      return UserData.fromJson(result['data']);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load album');
    }
  }

  Future<void> checkLogin() async {
    final String? name = SharedPreference.userName;
    final String? pass = SharedPreference.password;
    log(name.toString());
    log(pass.toString());

    if (name != null && name != '') {
      Get.offNamed(HomeScreen.routeName);
    } else {
      Get.offNamed(LoginScreen.routeName);
    }
  }
}
