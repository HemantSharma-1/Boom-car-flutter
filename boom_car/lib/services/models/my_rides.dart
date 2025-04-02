// To parse this JSON data, do
//
//     final getMyRides = getMyRidesFromMap(jsonString);

import 'dart:convert';

GetMyRides getMyRidesFromMap(String str) => GetMyRides.fromMap(json.decode(str));

String getMyRidesToMap(GetMyRides data) => json.encode(data.toMap());

class GetMyRides {
    bool? success;
    List<Booking>? bookings;

    GetMyRides({
        this.success,
        this.bookings,
    });

    factory GetMyRides.fromMap(Map<String, dynamic> json) => GetMyRides(
        success: json["success"],
        bookings: json["bookings"] == null ? [] : List<Booking>.from(json["bookings"]!.map((x) => Booking.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x.toMap())),
    };
}

class Booking {
    String? id;
    String? bookingId;
    HostedBy? hostedBy;
    CarListing? carListing;
    DateTime? startDate;
    DateTime? endDate;
    String? bookingStatus;
    int? tripAmount;
    int? tripProtectionFee;
    int? convenienceFee;
    int? totalAmount;
    String? paymentStatus;
    bool? isDoorstepDelivery;
    bool? isDamaged;
    List<dynamic>? carImages;
    List<dynamic>? damageImages;
    DateTime? createdAt;
    DateTime? updatedAt;

    Booking({
        this.id,
        this.bookingId,
        this.hostedBy,
        this.carListing,
        this.startDate,
        this.endDate,
        this.bookingStatus,
        this.tripAmount,
        this.tripProtectionFee,
        this.convenienceFee,
        this.totalAmount,
        this.paymentStatus,
        this.isDoorstepDelivery,
        this.isDamaged,
        this.carImages,
        this.damageImages,
        this.createdAt,
        this.updatedAt,
    });

    factory Booking.fromMap(Map<String, dynamic> json) => Booking(
        id: json["id"],
        bookingId: json["bookingId"],
        hostedBy: json["hostedBy"] == null ? null : HostedBy.fromMap(json["hostedBy"]),
        carListing: json["carListing"] == null ? null : CarListing.fromMap(json["carListing"]),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        bookingStatus: json["bookingStatus"],
        tripAmount: json["tripAmount"],
        tripProtectionFee: json["tripProtectionFee"],
        convenienceFee: json["convenienceFee"],
        totalAmount: json["totalAmount"],
        paymentStatus: json["paymentStatus"],
        isDoorstepDelivery: json["isDoorstepDelivery"],
        isDamaged: json["isDamaged"],
        carImages: json["carImages"] == null ? [] : List<dynamic>.from(json["carImages"]!.map((x) => x)),
        damageImages: json["damageImages"] == null ? [] : List<dynamic>.from(json["damageImages"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "bookingId": bookingId,
        "hostedBy": hostedBy?.toMap(),
        "carListing": carListing?.toMap(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "bookingStatus": bookingStatus,
        "tripAmount": tripAmount,
        "tripProtectionFee": tripProtectionFee,
        "convenienceFee": convenienceFee,
        "totalAmount": totalAmount,
        "paymentStatus": paymentStatus,
        "isDoorstepDelivery": isDoorstepDelivery,
        "isDamaged": isDamaged,
        "carImages": carImages == null ? [] : List<dynamic>.from(carImages!.map((x) => x)),
        "damageImages": damageImages == null ? [] : List<dynamic>.from(damageImages!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class CarListing {
    String? carName;
    String? carLocation;
    String? coverImage;
    String? registrationNumber;

    CarListing({
        this.carName,
        this.carLocation,
        this.coverImage,
        this.registrationNumber,
    });

    factory CarListing.fromMap(Map<String, dynamic> json) => CarListing(
        carName: json["carName"],
        carLocation: json["carLocation"],
        coverImage: json["coverImage"],
        registrationNumber: json["registrationNumber"],
    );

    Map<String, dynamic> toMap() => {
        "carName": carName,
        "carLocation": carLocation,
        "coverImage": coverImage,
        "registrationNumber": registrationNumber,
    };
}

class HostedBy {
    String? name;
    String? phone;
    String? profileImage;

    HostedBy({
        this.name,
        this.phone,
        this.profileImage,
    });

    factory HostedBy.fromMap(Map<String, dynamic> json) => HostedBy(
        name: json["name"],
        phone: json["phone"],
        profileImage: json["profileImage"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "profileImage": profileImage,
    };
}
