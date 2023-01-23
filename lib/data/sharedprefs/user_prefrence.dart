import 'package:shared_preferences/shared_preferences.dart';
import 'package:onevote/models/user_model.dart';

class UserPreference {
  void saveUser(UserModel userData) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', userData.token);
  }

  void saveUserDetails(User userData) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('name', userData.name);
    pref.setString('email', userData.email);
    pref.setString('voter_id', userData.voterid);
    pref.setString('image', userData.image);
  }

  Future<User> getUserDetails() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String username = pref.getString('name').toString();
    String useremail = pref.getString('email').toString();
    String uservin = pref.getString('voter_id').toString();
    String useravatar = pref.getString('image').toString();

    return User(
        name: username, email: useremail, voterid: uservin, image: useravatar);
  }

  Future<UserModel> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token').toString();

    return UserModel(token: token);
  }

  void removeUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('token');
  }
}
