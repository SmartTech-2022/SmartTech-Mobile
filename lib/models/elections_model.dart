// To parse this JSON data, do
//
//     final electionModel = electionModelFromJson(jsonString);

import 'dart:convert';

ElectionModel electionModelFromJson(String str) => ElectionModel.fromJson(json.decode(str));

String electionModelToJson(ElectionModel data) => json.encode(data.toJson());

class ElectionModel {
    ElectionModel({
        this.data,
    });

    List<Datum>? data;

    factory ElectionModel.fromJson(Map<String, dynamic> json) => ElectionModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}


// class ElectionModel {
//   List<Data>? data;

//   ElectionModel({this.data});

//   ElectionModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   int? active;

//   Data({this.id, this.name, this.active});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     active = json['active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['active'] = active;
//     return data;
//   }
// }