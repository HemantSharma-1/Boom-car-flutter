import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:http/http.dart' as http;

class CarInformationService {
  Future carInformation({
    required String token,
    required String carId,
    required String city,
    required String location,
    required String startDate,
    required String endDate,
    required String ownerName,
    required String registerationNumber,
    required String chasiNumber,
    required String engineNumber,
    required String type,
    required bool nightbookAvailability,
    required String minimumBookingDuration,
    required String interBookingDuration,
    required String maximumBookingDuration,
    required String rcImage,
    required String coverImage,
    required String exteriorImages,
    required String interiorImages,
    required String exteriorWithLicensePlateImages,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/listing/add');
      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token,
          },
          body: jsonEncode({
            "car": carId,
            "city": city,
            "carLocation": location,
            "carLatitude": 26.9206518,
            "carLongitude": 75.7232373,
            "carSharingStartDate": startDate,
            "carSharingEndDate": endDate,
            "ownerName": ownerName,
            "registrationNumber": registerationNumber,
            "chassisNumber": chasiNumber,
            "engineNumber": engineNumber,
            "carListingFor": type,
            "nightBookingAvailable": nightbookAvailability,
            "minimumBookingDuration": minimumBookingDuration,
            "interBookingDuration": interBookingDuration,
            "maximumBookingDuration": maximumBookingDuration,
            "rcImage": rcImage,
            "coverImage": coverImage,
            "exteriorImages": exteriorImages,
            "interiorImages": interiorImages,
            "exteriorWithLicensePlateImages": exteriorWithLicensePlateImages
          }));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        log(response.body);
        return json;
      } else {
        log("Login failed: ${response.body}");
        return jsonDecode(response.body);
      }
    } catch (e) {
      log("Exception during login: $e");
      return {"error": "Something went wrong", "exception": e.toString()};
    }
  }
}
