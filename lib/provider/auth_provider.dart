import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onevote/data/endpoints/endpoints.dart';
import 'package:onevote/data/sharedprefs/shared_preference_helper.dart';
import 'package:onevote/models/auth_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _resMessage = '';
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;
  login(data) async {
    String uri = EndPoints.baseUrl + EndPoints.login;
    var result;
    try {
      _isLoading = true;
      notifyListeners();
      var response = await http.post(Uri.parse(uri),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json",
          },
          body: jsonEncode(data));
      // print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        data = jsonDecode(response.body);
        result = UserModel.fromJson(data);
        _isLoading = false;
        var map = User.fromJson(data['user']);
        SharedPreferenceHelper().user(jsonEncode(map));
        SharedPreferenceHelper().authToken(data['token']);

        // _resMessage = "Login successfull!";
        notifyListeners();
        return result;
      } else if (response.statusCode >= 400) {
        final res = json.decode(response.body);
        _resMessage = res['message'];
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
    }
  }
}
