// To parse this JSON data, do
//
//     final carInformationModel = carInformationModelFromMap(jsonString);

import 'dart:convert';

CarInformationModel carInformationModelFromMap(String str) => CarInformationModel.fromMap(json.decode(str));

String carInformationModelToMap(CarInformationModel data) => json.encode(data.toMap());

class CarInformationModel {
    String? id;
    String? city;
    String? carLocation;
    HostedBy? hostedBy;
    Car? car;
    CarImages? carImages;
    String? carListingFor;
    bool? fastTagAvailable;
    int? totalTripsCompleted;
    List<dynamic>? carFeatures;
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
        carLocation: json["carLocation"],
        hostedBy: json["hostedBy"] == null ? null : HostedBy.fromMap(json["hostedBy"]),
        car: json["car"] == null ? null : Car.fromMap(json["car"]),
        carImages: json["carImages"] == null ? null : CarImages.fromMap(json["carImages"]),
        carListingFor: json["carListingFor"],
        fastTagAvailable: json["fastTagAvailable"],
        totalTripsCompleted: json["totalTripsCompleted"],
        carFeatures: json["carFeatures"] == null ? [] : List<dynamic>.from(json["carFeatures"]!.map((x) => x)),
        ratingsAndReviews: json["ratingsAndReviews"] == null ? null : RatingsAndReviews.fromMap(json["ratingsAndReviews"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "city": city,
        "carLocation": carLocation,
        "hostedBy": hostedBy?.toMap(),
        "car": car?.toMap(),
        "carImages": carImages?.toMap(),
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

class CarImages {
    String? coverImage;
    List<String>? exteriorImages;
    List<String>? interiorImages;
    List<String>? exteriorWithLicensePlateImages;

    CarImages({
        this.coverImage,
        this.exteriorImages,
        this.interiorImages,
        this.exteriorWithLicensePlateImages,
    });

    factory CarImages.fromMap(Map<String, dynamic> json) => CarImages(
        coverImage: json["coverImage"],
        exteriorImages: json["exteriorImages"] == null ? [] : List<String>.from(json["exteriorImages"]!.map((x) => x)),
        interiorImages: json["interiorImages"] == null ? [] : List<String>.from(json["interiorImages"]!.map((x) => x)),
        exteriorWithLicensePlateImages: json["exteriorWithLicensePlateImages"] == null ? [] : List<String>.from(json["exteriorWithLicensePlateImages"]!.map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "coverImage": coverImage,
        "exteriorImages": exteriorImages == null ? [] : List<dynamic>.from(exteriorImages!.map((x) => x)),
        "interiorImages": interiorImages == null ? [] : List<dynamic>.from(interiorImages!.map((x) => x)),
        "exteriorWithLicensePlateImages": exteriorWithLicensePlateImages == null ? [] : List<dynamic>.from(exteriorWithLicensePlateImages!.map((x) => x)),
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

    RatingsAndReviews({
        this.totalRatingsCount,
        this.totalReviewsCount,
        this.averageRating,
    });

    factory RatingsAndReviews.fromMap(Map<String, dynamic> json) => RatingsAndReviews(
        totalRatingsCount: json["totalRatingsCount"],
        totalReviewsCount: json["totalReviewsCount"],
        averageRating: json["averageRating"],
    );

    Map<String, dynamic> toMap() => {
        "totalRatingsCount": totalRatingsCount,
        "totalReviewsCount": totalReviewsCount,
        "averageRating": averageRating,
    };
}
