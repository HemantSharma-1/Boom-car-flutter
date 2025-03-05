import 'dart:convert';
import 'dart:developer';
import 'package:boom_car/config/config.dart';
import 'package:boom_car/services/models/car_list.dart';
import 'package:http/http.dart' as http;

class CarListHost {
  Future carListHost() async {
    try {
      final uri = Uri.parse('$baseUrl/car/all');
      final response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final json = carIListModelFromMap(response.body);
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