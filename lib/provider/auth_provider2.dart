import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onevote/data/endpoints/endpoints.dart';
import 'package:onevote/data/sharedprefs/user_prefrence.dart';
import 'package:onevote/models/user_model.dart';

enum Status {
  notLogin,
  loggingIn,
  loggedIn,
  notLoading,
  loading,
  loaded,
}

class AuthProvider2 with ChangeNotifier {
  Status _logginStatus = Status.notLogin;
  Status get logginStatus => _logginStatus;

  Future<Map<String, dynamic>> login(String voterid, String password) async {
    final Map<String, dynamic> loginBody = {
      "voter_id": voterid,
      "password": password
    };
    _logginStatus = Status.loggingIn;
    notifyListeners();
    var response = await post(Uri.parse(EndPoints.login),
            body: jsonEncode(loginBody),
            headers: {'content-Type': "application/json"})
        .then(onValue)
        .catchError(onError);
    _logginStatus = Status.loggedIn;
    notifyListeners();
    return response;
  }

  static Future onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var userData = responseData;
      UserModel token = UserModel.fromJson(userData);
      UserPreference().saveUser(token);
      User userdetails = User.fromJson(userData);
      UserPreference().saveUserDetails(userdetails);
      result = {
        'message': responseData['message'].toString(),
        'name': userdetails.name,
        'email': userdetails.email,
        'voterid': userdetails.voterid,
        'image': userdetails.image,
        // 'data': userdetails
      };
    }

    return result;
  }

  static onError(error) {
    return {'message': error};
  }
}
