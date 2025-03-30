import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:boom_car/services/models/my_rides.dart';
import 'package:http/http.dart' as http;

class GuestBooking {
  Future guestBooking({required String token}) async {
    try {
      final uri = Uri.parse('$baseUrl/booking/guest-bookings');
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        final json = getMyRidesFromMap(response.body);
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
