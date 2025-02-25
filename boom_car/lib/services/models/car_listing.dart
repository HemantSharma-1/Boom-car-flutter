// To parse this JSON data, do
//
//     final carListing = carListingFromMap(jsonString);

import 'dart:convert';

List<CarListing> carListingFromMap(String str) =>
    List<CarListing>.from(json.decode(str).map((x) => CarListing.fromMap(x)));

String carListingToMap(List<CarListing> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CarListing {
  String? id;
  String? city;
  CarLocation? carLocation;
  Car? car;
  CarImages? carImages;
  String? carListingFor;
  bool? fastTagAvailable;
  int? totalTripsCompleted;
  RatingsAndReviews? ratingsAndReviews;

  CarListing({
    this.id,
    this.city,
    this.carLocation,
    this.car,
    this.carImages,
    this.carListingFor,
    this.fastTagAvailable,
    this.totalTripsCompleted,
    this.ratingsAndReviews,
  });

  factory CarListing.fromMap(Map<String, dynamic> json) => CarListing(
        id: json["id"],
        city: json["city"],
        carLocation: json["carLocation"] == null
            ? null
            : CarLocation.fromMap(json["carLocation"]),
        car: json["car"] == null ? null : Car.fromMap(json["car"]),
        carImages: json["carImages"] == null
            ? null
            : CarImages.fromMap(json["carImages"]),
        carListingFor: json["carListingFor"],
        fastTagAvailable: json["fastTagAvailable"],
        totalTripsCompleted: json["totalTripsCompleted"],
        ratingsAndReviews: json["ratingsAndReviews"] == null
            ? null
            : RatingsAndReviews.fromMap(json["ratingsAndReviews"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "city": city,
        "carLocation": carLocation?.toMap(),
        "car": car?.toMap(),
        "carImages": carImages?.toMap(),
        "carListingFor": carListingFor,
        "fastTagAvailable": fastTagAvailable,
        "totalTripsCompleted": totalTripsCompleted,
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
        pricing:
            json["pricing"] == null ? null : Pricing.fromMap(json["pricing"]),
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
        lessThan24H: json["lessThan24h"] == null
            ? null
            : FiveToSevenDays.fromMap(json["lessThan24h"]),
        oneToThreeDays: json["oneToThreeDays"] == null
            ? null
            : FiveToSevenDays.fromMap(json["oneToThreeDays"]),
        threeToFiveDays: json["threeToFiveDays"] == null
            ? null
            : FiveToSevenDays.fromMap(json["threeToFiveDays"]),
        fiveToSevenDays: json["fiveToSevenDays"] == null
            ? null
            : FiveToSevenDays.fromMap(json["fiveToSevenDays"]),
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
        exteriorImages: json["exteriorImages"] == null
            ? []
            : List<String>.from(json["exteriorImages"]!.map((x) => x)),
        interiorImages: json["interiorImages"] == null
            ? []
            : List<String>.from(json["interiorImages"]!.map((x) => x)),
        exteriorWithLicensePlateImages:
            json["exteriorWithLicensePlateImages"] == null
                ? []
                : List<String>.from(
                    json["exteriorWithLicensePlateImages"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "coverImage": coverImage,
        "exteriorImages": exteriorImages == null
            ? []
            : List<dynamic>.from(exteriorImages!.map((x) => x)),
        "interiorImages": interiorImages == null
            ? []
            : List<dynamic>.from(interiorImages!.map((x) => x)),
        "exteriorWithLicensePlateImages": exteriorWithLicensePlateImages == null
            ? []
            : List<dynamic>.from(exteriorWithLicensePlateImages!.map((x) => x)),
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

class RatingsAndReviews {
  int? totalRatingsCount;
  int? totalReviewsCount;
  int? averageRating;

  RatingsAndReviews({
    this.totalRatingsCount,
    this.totalReviewsCount,
    this.averageRating,
  });

  factory RatingsAndReviews.fromMap(Map<String, dynamic> json) =>
      RatingsAndReviews(
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
