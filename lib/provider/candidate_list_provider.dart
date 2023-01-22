import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onevote/data/endpoints/endpoints.dart';
import 'package:onevote/data/sharedprefs/shared_preference_helper.dart';
import 'package:onevote/models/election_candidates_model.dart';

class CandidateListProvider extends ChangeNotifier {
  //;

  Future<ElectionCandidatesModel> getCandidateList(int id) async {
    final uri = '${EndPoints.baseUrl}${EndPoints.elections}/$id';
    print(uri);
    final userId = await SharedPreferenceHelper().getUserData();
    final token = await SharedPreferenceHelper().getToken();

    try {
      final request = await http.get(Uri.parse(uri), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer 100|Gdbl7WigK5PQKRRLstk23Yl7XssCMcvfLcIsh7Bp",
        HttpHeaders.acceptHeader: "application/json",
      });

      print(userId);

      if (request.statusCode == 200 || request.statusCode == 201) {
        if (json.decode(request.body)['data'] == null) {
          return ElectionCandidatesModel();
        } else {
          final electionModel = electionCandidatesModelFromJson(request.body);
          return electionModel;
        }
      } else {
        return ElectionCandidatesModel();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
