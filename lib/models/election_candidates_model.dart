// To parse this JSON data, do
//
//     final electionCandidatesModel = electionCandidatesModelFromJson(jsonString);

import 'dart:convert';

ElectionCandidatesModel electionCandidatesModelFromJson(String str) => ElectionCandidatesModel.fromJson(json.decode(str));

String electionCandidatesModelToJson(ElectionCandidatesModel data) => json.encode(data.toJson());

class ElectionCandidatesModel {
    ElectionCandidatesModel({
        this.success,
        this.data,
    });

    bool? success;
    Data? data;

    factory ElectionCandidatesModel.fromJson(Map<String, dynamic> json) => ElectionCandidatesModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.contestant,
    });

    int? id;
    String? name;
    int? active;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Contestant>? contestant;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        contestant: json["contestant"] == null ? [] : List<Contestant>.from(json["contestant"]!.map((x) => Contestant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "contestant": contestant == null ? [] : List<dynamic>.from(contestant!.map((x) => x.toJson())),
    };
}

class Contestant {
    Contestant({
        this.id,
        this.name,
        this.electionId,
        this.about,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.gender,
        this.party,
        this.partyLogo,
        this.contestantVote,
        this.votes,
    });

    int? id;
    String? name;
    int? electionId;
    String? about;
    dynamic position;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic image;
    dynamic gender;
    dynamic party;
    dynamic partyLogo;
    int? contestantVote;
    List<Vote>? votes;

    factory Contestant.fromJson(Map<String, dynamic> json) => Contestant(
        id: json["id"],
        name: json["name"],
        electionId: json["election_id"],
        about: json["about"],
        position: json["position"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        image: json["image"],
        gender: json["gender"],
        party: json["party"],
        partyLogo: json["party_logo"],
        contestantVote: json["contestant_vote"],
        votes: json["votes"] == null ? [] : List<Vote>.from(json["votes"]!.map((x) => Vote.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "election_id": electionId,
        "about": about,
        "position": position,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "gender": gender,
        "party": party,
        "party_logo": partyLogo,
        "contestant_vote": contestantVote,
        "votes": votes == null ? [] : List<dynamic>.from(votes!.map((x) => x.toJson())),
    };
}

class Vote {
    Vote({
        this.id,
        this.userId,
        this.electionId,
        this.contestantId,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    int? userId;
    int? electionId;
    int? contestantId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Vote.fromJson(Map<String, dynamic> json) => Vote(
        id: json["id"],
        userId: json["user_id"],
        electionId: json["election_id"],
        contestantId: json["contestant_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "election_id": electionId,
        "contestant_id": contestantId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
