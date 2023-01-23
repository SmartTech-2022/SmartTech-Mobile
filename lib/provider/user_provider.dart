import 'package:flutter/material.dart';
import 'package:onevote/models/user_model.dart';

class UserProvider with ChangeNotifier {
  var changeName = "";
  var useremail = "";
  var voterid = "";
  var useravatar = "";
  void setUserDetails(User user) {
    changeName = user.name;
    useremail = user.email;
    voterid = user.voterid;
    useravatar = user.image;
    notifyListeners();
  }
}
