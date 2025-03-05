import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:http/http.dart' as http;

class UserGoogleSignUp {
  Future userGoogleSignUp(
      {required String email,
      required String name,
      required String phno,
      required String profileImage}) async {
    try {
      final uri = Uri.parse('$baseUrl/auth/google/login');
      print('$email $profileImage $name $phno');
      final response = await http.post(
        uri,
        body: jsonEncode({
          "email": email,
          "profileImage": profileImage,
          "name": name,
          "phone": phno
        }),
        headers: {'Content-Type': 'application/json'},
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
