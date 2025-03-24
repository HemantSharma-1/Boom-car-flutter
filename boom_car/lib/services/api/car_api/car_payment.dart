import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:http/http.dart' as http;

class CarPayment {
  Future carPayment(
      {required String carID,
      required String startDate,
      required String endDate,
      required String tripAmount,
      required String tripProtectionFee,
      required String convenienceFee,
      required String token}) async {
    try {
      final uri = Uri.parse('$baseUrl/booking/add');
      final response = await http.post(
        uri,
        body: jsonEncode({
          "carListingId": carID,
          "startDate": startDate,
          "endDate": endDate,
          "tripAmount": tripAmount,
          "tripProtectionFee": tripProtectionFee,
          "convenienceFee": convenienceFee
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

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
