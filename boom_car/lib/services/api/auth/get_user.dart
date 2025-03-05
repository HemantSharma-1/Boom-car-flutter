import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:boom_car/services/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserDetails {
  Future userDetails({required String token}) async {
    try {
      final uri = Uri.parse('$baseUrl/user');
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        final json = userFromMap(response.body);
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
