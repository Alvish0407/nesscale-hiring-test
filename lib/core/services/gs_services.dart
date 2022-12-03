import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class GSServices {
  GSServices._();
  static final GetStorage _userGS = GetStorage('user');

  static Future<void> initialize() async {
    await GetStorage.init('user');
  }

  static Map<String, dynamic>? getCurrentUserData() {
    debugPrint(
        "getCurrentUserData: ${_userGS.read<Map<String, dynamic>?>('userData')}");
    return _userGS.read<Map<String, dynamic>?>('userData');
  }

  static Future<void> setCurrentUserData(Map<String, dynamic> userData) async {
    debugPrint("setCurrentUserData: $userData");
    await _userGS.write('userData', userData);
    getCurrentUserData();
  }

  static Future<void> clearLocalStorage() async {
    await _userGS.erase();
  }
}
