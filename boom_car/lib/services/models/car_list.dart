// To parse this JSON data, do
//
//     final carIListModel = carIListModelFromMap(jsonString);

import 'dart:convert';

List<CarIListModel> carIListModelFromMap(String str) => List<CarIListModel>.from(json.decode(str).map((x) => CarIListModel.fromMap(x)));

String carIListModelToMap(List<CarIListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CarIListModel {
    String? id;
    String? brandName;
    String? model;
    String? variant;
    int? year;
    String? carType;
    String? fuelType;
    String? transmission;
    int? seatCapacity;
    Pricing? pricing;
    DateTime? createdAt;
    DateTime? updatedAt;

    CarIListModel({
        this.id,
        this.brandName,
        this.model,
        this.variant,
        this.year,
        this.carType,
        this.fuelType,
        this.transmission,
        this.seatCapacity,
        this.pricing,
        this.createdAt,
        this.updatedAt,
    });

    factory CarIListModel.fromMap(Map<String, dynamic> json) => CarIListModel(
        id: json["id"],
        brandName: json["brandName"],
        model: json["model"],
        variant: json["variant"],
        year: json["year"],
        carType: json["carType"],
        fuelType: json["fuelType"],
        transmission: json["transmission"],
        seatCapacity: json["seatCapacity"],
        pricing: json["pricing"] == null ? null : Pricing.fromMap(json["pricing"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "brandName": brandName,
        "model": model,
        "variant": variant,
        "year": year,
        "carType": carType,
        "fuelType": fuelType,
        "transmission": transmission,
        "seatCapacity": seatCapacity,
        "pricing": pricing?.toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
