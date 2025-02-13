import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:boom_car/services/models/car_listing.dart';
import 'package:http/http.dart' as http;

class CarList {
  Future carList({
    required String token,
    required String state,
    required DateTime startDate,
    required DateTime endDate,
    required String type,
    required bool doorStepDelivery,
  }) async {
    try {
      print(startDate);
      print(endDate);
      final uri = Uri.parse(
          '$baseUrl/listing/all?city=$state&startDate=2025-02-11T00:00:00.000Z&endDate=2025-02-18T00:00:00.000Z&carListingFor=$type&doorStepDelivery=$doorStepDelivery');
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        final json = carListingFromMap(response.body);
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
