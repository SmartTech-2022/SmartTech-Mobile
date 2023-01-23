import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onevote/data/endpoints/endpoints.dart';
import 'package:onevote/data/sharedprefs/shared_preference_helper.dart';
import 'package:onevote/models/election_candidates_model.dart';

class CandidateListProvider extends ChangeNotifier {
  String _resTitle = '';
  String get resTitle => _resTitle;
  Future<ElectionCandidatesModel> getCandidateList(int id) async {
    final uri = '${EndPoints.baseUrl}${EndPoints.elections}/$id';
    final token = jsonDecode(await SharedPreferenceHelper().getToken());

    try {
      final request = await http.get(Uri.parse(uri), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.acceptHeader: "application/json",
      });

      if (request.statusCode == 200 || request.statusCode == 201) {
        if (json.decode(request.body)['data'] == null) {
          return ElectionCandidatesModel();
        } else {
          final electionModel = electionCandidatesModelFromJson(request.body);
          _resTitle = electionModel.data!.name!;
          return electionModel;
        }
      } else {
        return ElectionCandidatesModel();
      }
    } on SocketException catch (e) {
      // _isLoading = false;
      // _resMessage = "Internet connection is not available";
      return Future.error(e.toString());
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
