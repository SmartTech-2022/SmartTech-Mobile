import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    String _userData = '';
  String get userData => _userData;
  String _token = '';
  String get token => _token;
  authToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", jsonEncode(token));
  }
  user(String userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", jsonEncode(userData));
  }

  Future<void> setSeenOnboarding() async {
    int isSeen = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoarding', isSeen);
  }
  Future<String> getUserData() async {
    SharedPreferences value = await _prefs;

    if (value.containsKey('user')) {
      String data = value.getString('user')!;
      _userData = data;
      notifyListeners();
      return data;
    } else {
      _userData = '';
      notifyListeners();
      return '';
    }
  }
  Future<String> getToken() async {
    SharedPreferences value = await _prefs;

    if (value.containsKey('auth_token')) {
      String data = value.getString('auth_token')!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }
}