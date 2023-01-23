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
    final token = jsonDecode(await SharedPreferenceHelper().getToken());

    try {
      final request = await http.get(Uri.parse(uri), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",//
        HttpHeaders.acceptHeader: "application/json",
      });

      if (request.statusCode == 200 || request.statusCode == 201){

        if (json.decode(request.body)['data'] == null) {
          return ElectionModel();
        } else {
          final electionModel = electionModelFromJson(request.body);
          return electionModel;
        }
      } else {
       return ElectionModel();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
