// To parse this JSON data, do
//
//     final electionModel = electionModelFromJson(jsonString);

import 'dart:convert';

ElectionModel electionModelFromJson(String str) =>
    ElectionModel.fromJson(json.decode(str));

String electionModelToJson(ElectionModel data) => json.encode(data.toJson());

class ElectionModel {
  ElectionModel({
    this.data,
  });

  List<Datum>? data;

  factory ElectionModel.fromJson(Map<String, dynamic> json) => ElectionModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}