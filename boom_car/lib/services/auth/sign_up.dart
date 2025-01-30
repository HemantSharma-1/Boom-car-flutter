import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:http/http.dart' as http;

class UserSignUp {
  Future userSignUp({
    required String email,
    required String password,
    required String name,
    required String phno,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/auth/register');
      final response = await http.post(
        uri,
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
          "phone": phno,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        log(response.body);
        return json;
      } else {
        log("Login failed: ${response.body}");
        return {"error": "Login failed", "statusCode": response.statusCode};
      }
    } catch (e) {
      log("Exception during login: $e");
      return {"error": "Something went wrong", "exception": e.toString()};
    }
  }
}
