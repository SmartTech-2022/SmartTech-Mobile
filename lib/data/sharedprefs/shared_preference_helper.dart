import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "Token";

  Future<void> setUserToken({required String userToken}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, userToken);
    print(prefs.getString(token));
  }

  Future<String> getUserToken({required userToken}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    userToken = pref.getString(userToken);
    return userToken;
  }

  Future <void> setSeenOnboarding() async {
    int isSeen = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoarding', isSeen);
  }
}
