// To parse this JSON data, do
//
//     final carListing = carListingFromMap(jsonString);

import 'dart:convert';

List<CarListing> carListingFromMap(String str) => List<CarListing>.from(json.decode(str).map((x) => CarListing.fromMap(x)));

String carListingToMap(List<CarListing> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CarListing {
    CarImages? carImages;
    RatingsAndReviews? ratingsAndReviews;
    String? id;
    Car? car;
    String? ownerName;
    String? registrationNumber;
    String? chassisNumber;
    String? engineNumber;
    String? carListingFor;
    bool? nightBookingAvailable;
    int? minimumBookingDuration;
    int? interBookingDuration;
    int? maximumBookingDuration;
    bool? isListingApproved;
    bool? isPaused;
    bool? fastTagAvailable;
    int? totalTripsCompleted;
    int? v;

    CarListing({
        this.carImages,
        this.ratingsAndReviews,
        this.id,
        this.car,
        this.ownerName,
        this.registrationNumber,
        this.chassisNumber,
        this.engineNumber,
        this.carListingFor,
        this.nightBookingAvailable,
        this.minimumBookingDuration,
        this.interBookingDuration,
        this.maximumBookingDuration,
        this.isListingApproved,
        this.isPaused,
        this.fastTagAvailable,
        this.totalTripsCompleted,
        this.v,
    });

    factory CarListing.fromMap(Map<String, dynamic> json) => CarListing(
        carImages: json["carImages"] == null ? null : CarImages.fromMap(json["carImages"]),
        ratingsAndReviews: json["ratingsAndReviews"] == null ? null : RatingsAndReviews.fromMap(json["ratingsAndReviews"]),
        id: json["_id"],
        car: json["car"] == null ? null : Car.fromMap(json["car"]),
        ownerName: json["ownerName"],
        registrationNumber: json["registrationNumber"],
        chassisNumber: json["chassisNumber"],
        engineNumber: json["engineNumber"],
        carListingFor: json["carListingFor"],
        nightBookingAvailable: json["nightBookingAvailable"],
        minimumBookingDuration: json["minimumBookingDuration"],
        interBookingDuration: json["interBookingDuration"],
        maximumBookingDuration: json["maximumBookingDuration"],
        isListingApproved: json["isListingApproved"],
        isPaused: json["isPaused"],
        fastTagAvailable: json["fastTagAvailable"],
        totalTripsCompleted: json["totalTripsCompleted"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "carImages": carImages?.toMap(),
        "ratingsAndReviews": ratingsAndReviews?.toMap(),
        "_id": id,
        "car": car?.toMap(),
        "ownerName": ownerName,
        "registrationNumber": registrationNumber,
        "chassisNumber": chassisNumber,
        "engineNumber": engineNumber,
        "carListingFor": carListingFor,
        "nightBookingAvailable": nightBookingAvailable,
        "minimumBookingDuration": minimumBookingDuration,
        "interBookingDuration": interBookingDuration,
        "maximumBookingDuration": maximumBookingDuration,
        "isListingApproved": isListingApproved,
        "isPaused": isPaused,
        "fastTagAvailable": fastTagAvailable,
        "totalTripsCompleted": totalTripsCompleted,
        "__v": v,
    };
}

class Car {
    Pricing? pricing;
    String? id;
    String? brandName;
    String? model;
    String? variant;
    int? year;
    String? carType;
    String? fuelType;
    String? transmission;
    int? seatCapacity;
    int? v;

    Car({
        this.pricing,
        this.id,
        this.brandName,
        this.model,
        this.variant,
        this.year,
        this.carType,
        this.fuelType,
        this.transmission,
        this.seatCapacity,
        this.v,
    });

    factory Car.fromMap(Map<String, dynamic> json) => Car(
        pricing: json["pricing"] == null ? null : Pricing.fromMap(json["pricing"]),
        id: json["_id"],
        brandName: json["brandName"],
        model: json["model"],
        variant: json["variant"],
        year: json["year"],
        carType: json["carType"],
        fuelType: json["fuelType"],
        transmission: json["transmission"],
        seatCapacity: json["seatCapacity"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "pricing": pricing?.toMap(),
        "_id": id,
        "brandName": brandName,
        "model": model,
        "variant": variant,
        "year": year,
        "carType": carType,
        "fuelType": fuelType,
        "transmission": transmission,
        "seatCapacity": seatCapacity,
        "__v": v,
    };
}

class Pricing {
    int? minHourlyPrice;
    int? maxHourlyPrice;

    Pricing({
        this.minHourlyPrice,
        this.maxHourlyPrice,
    });

    factory Pricing.fromMap(Map<String, dynamic> json) => Pricing(
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

    CarImages({
        this.coverImage,
    });

    factory CarImages.fromMap(Map<String, dynamic> json) => CarImages(
        coverImage: json["coverImage"],
    );

    Map<String, dynamic> toMap() => {
        "coverImage": coverImage,
    };
}

class RatingsAndReviews {
    int? totalRatingsCount;
    int? totalReviewsCount;
    int? averageRating;
    List<dynamic>? reviewers;

    RatingsAndReviews({
        this.totalRatingsCount,
        this.totalReviewsCount,
        this.averageRating,
        this.reviewers,
    });

    factory RatingsAndReviews.fromMap(Map<String, dynamic> json) => RatingsAndReviews(
        totalRatingsCount: json["totalRatingsCount"],
        totalReviewsCount: json["totalReviewsCount"],
        averageRating: json["averageRating"],
        reviewers: json["reviewers"] == null ? [] : List<dynamic>.from(json["reviewers"]!.map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "totalRatingsCount": totalRatingsCount,
        "totalReviewsCount": totalReviewsCount,
        "averageRating": averageRating,
        "reviewers": reviewers == null ? [] : List<dynamic>.from(reviewers!.map((x) => x)),
    };
}
