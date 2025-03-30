// To parse this JSON data, do
//
//     final getMyRidesDetails = getMyRidesDetailsFromMap(jsonString);

import 'dart:convert';

GetMyRidesDetails getMyRidesDetailsFromMap(String str) => GetMyRidesDetails.fromMap(json.decode(str));

String getMyRidesDetailsToMap(GetMyRidesDetails data) => json.encode(data.toMap());

class GetMyRidesDetails {
    bool? success;
    Booking? booking;

    GetMyRidesDetails({
        this.success,
        this.booking,
    });

    factory GetMyRidesDetails.fromMap(Map<String, dynamic> json) => GetMyRidesDetails(
        success: json["success"],
        booking: json["booking"] == null ? null : Booking.fromMap(json["booking"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "booking": booking?.toMap(),
    };
}

class Booking {
    String? id;
    String? bookingId;
    BookedBy? bookedBy;
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
        this.bookedBy,
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
        bookedBy: json["bookedBy"] == null ? null : BookedBy.fromMap(json["bookedBy"]),
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
        "bookedBy": bookedBy?.toMap(),
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

class BookedBy {
    String? name;
    String? phone;
    String? profileImage;

    BookedBy({
        this.name,
        this.phone,
        this.profileImage,
    });

    factory BookedBy.fromMap(Map<String, dynamic> json) => BookedBy(
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

class CarListing {
    String? carLocation;
    String? coverImage;
    String? registrationNumber;

    CarListing({
        this.carLocation,
        this.coverImage,
        this.registrationNumber,
    });

    factory CarListing.fromMap(Map<String, dynamic> json) => CarListing(
        carLocation: json["carLocation"],
        coverImage: json["coverImage"],
        registrationNumber: json["registrationNumber"],
    );

    Map<String, dynamic> toMap() => {
        "carLocation": carLocation,
        "coverImage": coverImage,
        "registrationNumber": registrationNumber,
    };
}
