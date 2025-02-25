// To parse this JSON data, do
//
//     final carReviewModel = carReviewModelFromMap(jsonString);

import 'dart:convert';

List<CarReviewModel> carReviewModelFromMap(String str) => List<CarReviewModel>.from(json.decode(str).map((x) => CarReviewModel.fromMap(x)));

String carReviewModelToMap(List<CarReviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CarReviewModel {
    User? user;
    int? rating;
    String? review;

    CarReviewModel({
        this.user,
        this.rating,
        this.review,
    });

    factory CarReviewModel.fromMap(Map<String, dynamic> json) => CarReviewModel(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        rating: json["rating"],
        review: json["review"],
    );

    Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "rating": rating,
        "review": review,
    };
}

class User {
    String? name;
    String? profileImage;

    User({
        this.name,
        this.profileImage,
    });

    factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        profileImage: json["profileImage"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "profileImage": profileImage,
    };
}
