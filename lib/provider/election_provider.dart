import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onevote/data/endpoints/endpoints.dart';
import 'package:onevote/data/sharedprefs/shared_preference_helper.dart';
import 'package:onevote/models/elections_model.dart';

class ElectionProvider extends ChangeNotifier {
  final uri = EndPoints.baseUrl + EndPoints.elections;

  Future<ElectionModel> getElections() async {
    final userId = await SharedPreferenceHelper().getUserData();
    final token = await SharedPreferenceHelper().getToken();

    try {
      final request = await http.get(Uri.parse(uri), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Authorization': "Bearer $token",
        HttpHeaders.acceptHeader: "application/json",
      });

      print(token);

      if (request.statusCode == 200 || request.statusCode == 201) {
        //print(request.statusCode);

          final electionModel = electionModelFromJson(request.body);
          print(electionModel.toString());
          return electionModel;
          
      } else {
        print(request.body);
        // final notificationModel = notificationModelFromJson(request.body);

        return ElectionModel();
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }
}
