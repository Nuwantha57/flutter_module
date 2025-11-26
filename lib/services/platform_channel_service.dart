import 'package:flutter/services.dart';

class PlatformChannelService {
  static const platform = MethodChannel('com.eyepax.mvvm_app/user_data');

  Future<Map<String, dynamic>?> getUserDataFromNative() async {
    try {
      final result = await platform.invokeMethod('getUserData');
      return Map<String, dynamic>.from(result);
    } on PlatformException catch (e) {
      print("Failed to get user data: ${e.message}");
      return null;
    }
  }
}
