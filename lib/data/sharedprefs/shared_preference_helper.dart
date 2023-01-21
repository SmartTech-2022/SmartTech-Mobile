import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String user = "User";

  // Future<void> setUserString({required userString}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setStringList(user, userString);
  //   print(prefs.getStringList(user));
  // }

  // getUserString() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   final List<String>? items = pref.getStringList("User");
  //   return items;
  // }
  userData(userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_data", jsonEncode(userData));
  }

  authToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", jsonEncode(token));
  }

  Future<void> setSeenOnboarding() async {
    int isSeen = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoarding', isSeen);
  }
}
