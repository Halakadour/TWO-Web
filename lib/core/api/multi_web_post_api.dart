import 'dart:convert'; // For base64 encoding
import 'dart:developer';
import 'dart:typed_data'; // For Uint8List
import 'package:http/http.dart' as http;

import '../error/handling_exception_request.dart';

typedef FromJson<T> = T Function(String body);

class MultiWebPostApi with HandlingExceptionRequest {
  final Uri uri;
  final Map<String, String> body;
  final Map<String, Uint8List> images; // Store images as Uint8List
  final FromJson fromJson;
  final Duration timeout;
  final String token;

  const MultiWebPostApi({
    required this.uri,
    required this.body,
    required this.images, // Images now stored as Uint8List
    required this.fromJson,
    this.timeout = const Duration(seconds: 40),
    required this.token,
  });

  Future<dynamic> callRequest() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Convert images to base64
      Map<String, String> base64Images = {};
      for (var entry in images.entries) {
        final base64String =
            base64Encode(entry.value); // Convert Uint8List to base64
        base64Images[entry.key] = base64String;
      }

      // Combine body and images into JSON payload
      var updatedBody = Map<String, String>.from(body)..addAll(base64Images);

      var response = await http
          .post(
            uri,
            headers: headers,
            body: jsonEncode(updatedBody),
          )
          .timeout(timeout);

      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on FormatException {
      log(
        'something went wrong in parsing the uri',
        name: 'RequestManager post function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'RequestManager post function',
      );
      rethrow;
    }
  }
}
