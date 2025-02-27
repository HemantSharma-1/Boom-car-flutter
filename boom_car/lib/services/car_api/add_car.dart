import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:boom_car/config/config.dart';
import 'package:http/http.dart' as http;

class AddCarApi {
  Future addCarApi({
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
    required File rcImage,
    required File coverImage,
    required List<File> exteriorImages,
    required List<File> interiorImages,
    required List<File> exteriorWithLicensePlateImages,
    String? driverName,
    String? aadhaarNumber,
    String? experienceYears,
    File? driverProfilePicture,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/listing/add');
      var request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = 'multipart/form-data'
        ..headers['Authorization'] = token;

      // Add the form fields
      request.fields['car'] = carId;
      request.fields['city'] = city;
      request.fields['carLocation'] = location;
      request.fields['carLatitude'] = '26.9206518';
      request.fields['carLongitude'] = '75.7232373';
      request.fields['carSharingStartDate'] = startDate;
      request.fields['carSharingEndDate'] = endDate;
      request.fields['ownerName'] = ownerName;
      request.fields['registrationNumber'] = registerationNumber;
      request.fields['chassisNumber'] = chasiNumber;
      request.fields['engineNumber'] = engineNumber;
      request.fields['carListingFor'] = type;
      request.fields['nightBookingAvailable'] =
          nightbookAvailability.toString();
      request.fields['minimumBookingDuration'] = minimumBookingDuration;
      request.fields['interBookingDuration'] = interBookingDuration;
      request.fields['maximumBookingDuration'] = maximumBookingDuration;

      log('RC Image path: ${rcImage.path}');
      log('Cover Image path: ${coverImage.path}');

      if (rcImage.existsSync()) {
        request.files
            .add(await http.MultipartFile.fromPath('rcImage', rcImage.path));
      } else {
        log("RC Image file does not exist at path: ${rcImage.path}");
      }

      if (coverImage.existsSync()) {
        request.files.add(
            await http.MultipartFile.fromPath('coverImage', coverImage.path));
      } else {
        log("Cover Image file does not exist at path: ${coverImage.path}");
      }

      for (var exteriorImage in exteriorImages) {
        request.files.add(await http.MultipartFile.fromPath(
            'exteriorImages', exteriorImage.path));
      }

      for (var interiorImage in interiorImages) {
        request.files.add(await http.MultipartFile.fromPath(
            'interiorImages', interiorImage.path));
      }

      for (var exteriorWithLicensePlateImage
          in exteriorWithLicensePlateImages) {
        request.files.add(await http.MultipartFile.fromPath(
            'exteriorWithLicensePlateImages',
            exteriorWithLicensePlateImage.path));
      }

      // Add driver details only if available
      if (driverName != null &&
          aadhaarNumber != null &&
          experienceYears != null) {
        Map<String, String> driverDetails = {
          "driverName": driverName,
          "aadhaarNumber": aadhaarNumber,
          "experienceYears": experienceYears,
        };
        request.fields['driverDetails'] = jsonEncode(driverDetails);
      }

      // Add driver profile picture if available
      if (driverProfilePicture != null && driverProfilePicture.existsSync()) {
        request.files.add(await http.MultipartFile.fromPath(
            'driverProfilePicture', driverProfilePicture.path));
      }

      // Send the request
      final response = await request.send();
      final responseBody = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final json = jsonDecode(responseBody.body);
        log(responseBody.body);
        return json;
      } else {
        log("Request failed: ${responseBody.body}");
        return jsonDecode(responseBody.body);
      }
    } catch (e) {
      log("Exception during request: $e");
      return {"error": "Something went wrong", "exception": e.toString()};
    }
  }
}
