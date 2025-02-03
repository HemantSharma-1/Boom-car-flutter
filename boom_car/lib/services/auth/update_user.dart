import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:http/http.dart' as http;

class UpdateUser {
  Future updateUser(
      {required String email,
      required String password,
      required String name,
      required String auth}) async {
    try {
      final uri = Uri.parse('$baseUrl/user');
      final response = await http.put(
        uri,
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': auth,
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
