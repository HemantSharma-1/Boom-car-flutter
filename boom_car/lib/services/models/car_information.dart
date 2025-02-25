// To parse this JSON data, do
//
//     final carInformationModel = carInformationModelFromMap(jsonString);

import 'dart:convert';

CarInformationModel carInformationModelFromMap(String str) => CarInformationModel.fromMap(json.decode(str));

String carInformationModelToMap(CarInformationModel data) => json.encode(data.toMap());

class CarInformationModel {
    String? id;
    String? city;
    CarLocation? carLocation;
    HostedBy? hostedBy;
    Car? car;
    List<CarImage>? carImages;
    String? carListingFor;
    bool? fastTagAvailable;
    int? totalTripsCompleted;
    List<String>? carFeatures;
    RatingsAndReviews? ratingsAndReviews;

    CarInformationModel({
        this.id,
        this.city,
        this.carLocation,
        this.hostedBy,
        this.car,
        this.carImages,
        this.carListingFor,
        this.fastTagAvailable,
        this.totalTripsCompleted,
        this.carFeatures,
        this.ratingsAndReviews,
    });

    factory CarInformationModel.fromMap(Map<String, dynamic> json) => CarInformationModel(
        id: json["id"],
        city: json["city"],
        carLocation: json["carLocation"] == null ? null : CarLocation.fromMap(json["carLocation"]),
        hostedBy: json["hostedBy"] == null ? null : HostedBy.fromMap(json["hostedBy"]),
        car: json["car"] == null ? null : Car.fromMap(json["car"]),
        carImages: json["carImages"] == null ? [] : List<CarImage>.from(json["carImages"]!.map((x) => CarImage.fromMap(x))),
        carListingFor: json["carListingFor"],
        fastTagAvailable: json["fastTagAvailable"],
        totalTripsCompleted: json["totalTripsCompleted"],
        carFeatures: json["carFeatures"] == null ? [] : List<String>.from(json["carFeatures"]!.map((x) => x)),
        ratingsAndReviews: json["ratingsAndReviews"] == null ? null : RatingsAndReviews.fromMap(json["ratingsAndReviews"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "city": city,
        "carLocation": carLocation?.toMap(),
        "hostedBy": hostedBy?.toMap(),
        "car": car?.toMap(),
        "carImages": carImages == null ? [] : List<dynamic>.from(carImages!.map((x) => x.toMap())),
        "carListingFor": carListingFor,
        "fastTagAvailable": fastTagAvailable,
        "totalTripsCompleted": totalTripsCompleted,
        "carFeatures": carFeatures == null ? [] : List<dynamic>.from(carFeatures!.map((x) => x)),
        "ratingsAndReviews": ratingsAndReviews?.toMap(),
    };
}

class Car {
    String? carId;
    String? brandName;
    String? model;
    String? variant;
    int? year;
    String? carType;
    String? fuelType;
    String? transmission;
    int? seatCapacity;
    Pricing? pricing;

    Car({
        this.carId,
        this.brandName,
        this.model,
        this.variant,
        this.year,
        this.carType,
        this.fuelType,
        this.transmission,
        this.seatCapacity,
        this.pricing,
    });

    factory Car.fromMap(Map<String, dynamic> json) => Car(
        carId: json["carId"],
        brandName: json["brandName"],
        model: json["model"],
        variant: json["variant"],
        year: json["year"],
        carType: json["carType"],
        fuelType: json["fuelType"],
        transmission: json["transmission"],
        seatCapacity: json["seatCapacity"],
        pricing: json["pricing"] == null ? null : Pricing.fromMap(json["pricing"]),
    );

    Map<String, dynamic> toMap() => {
        "carId": carId,
        "brandName": brandName,
        "model": model,
        "variant": variant,
        "year": year,
        "carType": carType,
        "fuelType": fuelType,
        "transmission": transmission,
        "seatCapacity": seatCapacity,
        "pricing": pricing?.toMap(),
    };
}

class Pricing {
    FiveToSevenDays? lessThan24H;
    FiveToSevenDays? oneToThreeDays;
    FiveToSevenDays? threeToFiveDays;
    FiveToSevenDays? fiveToSevenDays;

    Pricing({
        this.lessThan24H,
        this.oneToThreeDays,
        this.threeToFiveDays,
        this.fiveToSevenDays,
    });

    factory Pricing.fromMap(Map<String, dynamic> json) => Pricing(
        lessThan24H: json["lessThan24h"] == null ? null : FiveToSevenDays.fromMap(json["lessThan24h"]),
        oneToThreeDays: json["oneToThreeDays"] == null ? null : FiveToSevenDays.fromMap(json["oneToThreeDays"]),
        threeToFiveDays: json["threeToFiveDays"] == null ? null : FiveToSevenDays.fromMap(json["threeToFiveDays"]),
        fiveToSevenDays: json["fiveToSevenDays"] == null ? null : FiveToSevenDays.fromMap(json["fiveToSevenDays"]),
    );

    Map<String, dynamic> toMap() => {
        "lessThan24h": lessThan24H?.toMap(),
        "oneToThreeDays": oneToThreeDays?.toMap(),
        "threeToFiveDays": threeToFiveDays?.toMap(),
        "fiveToSevenDays": fiveToSevenDays?.toMap(),
    };
}

class FiveToSevenDays {
    int? minHourlyPrice;
    int? maxHourlyPrice;

    FiveToSevenDays({
        this.minHourlyPrice,
        this.maxHourlyPrice,
    });

    factory FiveToSevenDays.fromMap(Map<String, dynamic> json) => FiveToSevenDays(
        minHourlyPrice: json["minHourlyPrice"],
        maxHourlyPrice: json["maxHourlyPrice"],
    );

    Map<String, dynamic> toMap() => {
        "minHourlyPrice": minHourlyPrice,
        "maxHourlyPrice": maxHourlyPrice,
    };
}

class CarImage {
    String? image;
    String? type;

    CarImage({
        this.image,
        this.type,
    });

    factory CarImage.fromMap(Map<String, dynamic> json) => CarImage(
        image: json["Image"],
        type: json["Type"],
    );

    Map<String, dynamic> toMap() => {
        "Image": image,
        "Type": type,
    };
}

class CarLocation {
    String? location;
    double? latitude;
    double? longitude;

    CarLocation({
        this.location,
        this.latitude,
        this.longitude,
    });

    factory CarLocation.fromMap(Map<String, dynamic> json) => CarLocation(
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class HostedBy {
    String? hostId;
    String? name;
    String? profileImage;

    HostedBy({
        this.hostId,
        this.name,
        this.profileImage,
    });

    factory HostedBy.fromMap(Map<String, dynamic> json) => HostedBy(
        hostId: json["hostId"],
        name: json["name"],
        profileImage: json["profileImage"],
    );

    Map<String, dynamic> toMap() => {
        "hostId": hostId,
        "name": name,
        "profileImage": profileImage,
    };
}

class RatingsAndReviews {
    int? totalRatingsCount;
    int? totalReviewsCount;
    int? averageRating;
    Map<String, int>? ratings;
    List<Review>? reviews;

    RatingsAndReviews({
        this.totalRatingsCount,
        this.totalReviewsCount,
        this.averageRating,
        this.ratings,
        this.reviews,
    });

    factory RatingsAndReviews.fromMap(Map<String, dynamic> json) => RatingsAndReviews(
        totalRatingsCount: json["totalRatingsCount"],
        totalReviewsCount: json["totalReviewsCount"],
        averageRating: json["averageRating"],
        ratings: Map.from(json["ratings"]!).map((k, v) => MapEntry<String, int>(k, v)),
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "totalRatingsCount": totalRatingsCount,
        "totalReviewsCount": totalReviewsCount,
        "averageRating": averageRating,
        "ratings": Map.from(ratings!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toMap())),
    };
}

class Review {
    User? user;
    int? rating;
    String? review;

    Review({
        this.user,
        this.rating,
        this.review,
    });

    factory Review.fromMap(Map<String, dynamic> json) => Review(
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
