import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String user = "User";

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
