import 'package:get_storage/get_storage.dart';

class SharedPreference {

  static final _getStorage = GetStorage();
  static const _userName = 'userName';
  static const _password = 'password';

  static Future<void> setUserName(String userName) async {
    return _getStorage.write(_userName, userName);
  }

  static String? get userName {
    return _getStorage.read(_userName);
  }

  static Future<void> setPass(String password) async {
    return _getStorage.write(_password, password);
  }

  static String? get password {
    return _getStorage.read(_password);
  }

  static void clear() => _getStorage.erase();
}