import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:boom_car/config/config.dart';
import 'package:http/http.dart' as http;

class StartBooking {
  Future startBooking(
      {required String bookingId,
      required String otp,
      required List<File> carImages,
      required String authToken}) async {
    try {
      final uri = Uri.parse('$baseUrl/booking/start-booking');
      var request = http.MultipartRequest('PUT', uri);

      // Add authorization header
      request.headers['Authorization'] = authToken;

      // Add fields to the request
      request.fields['bookingId'] = bookingId;
      request.fields['otp'] = otp;

      // Attach images as multipart files
      for (var image in carImages) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile('carImages', stream, length,
            filename: image.path.split('/').last);
        request.files.add(multipartFile);
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final json = jsonDecode(respStr);
        log(respStr);
        return json;
      } else {
        final respStr = await response.stream.bytesToString();
        log("Booking failed: $respStr");
        return jsonDecode(respStr);
      }
    } catch (e) {
      log("Exception during booking: $e");
      return {"error": "Something went wrong", "exception": e.toString()};
    }
  }
}
