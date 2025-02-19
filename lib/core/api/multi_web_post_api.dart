import 'dart:developer';
import 'dart:convert'; // Importing for base64 encoding
import 'dart:io';

import 'package:http/http.dart' as http;

import '../error/handling_exception_request.dart';

typedef FromJson<T> = T Function(String body);

class MultiWebPostApi with HandlingExceptionRequest {
  final Uri uri;
  final Map<String, String> body;
  final Map<String, File> images; // Original File type remains
  final FromJson fromJson;
  final Duration timeout;
  final String token;

  const MultiWebPostApi({
    required this.uri,
    required this.body,
    required this.images,
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

      // Converting images to base64
      Map<String, String> base64Images = {};
      for (var item in images.entries) {
        final bytes = await item.value.readAsBytes(); // Read file as bytes
        final base64String = base64Encode(bytes); // Convert bytes to base64
        base64Images[item.key] =
            base64String; // Store base64 string with the same key
      }

      // Combine body and images (now base64) into the request
      var updatedBody = Map<String, String>.from(body)..addAll(base64Images);

      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.fields
          .addAll(updatedBody); // Adding all fields (body + base64 images)
      request.headers.addAll(headers);

      http.StreamedResponse streamedResponse =
          await request.send().timeout(timeout);
      http.Response response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      log(
        'HTTP exception occurred',
        name: 'MultiWebPostApi post function',
      );
      rethrow;
    } on FormatException {
      log(
        'Error parsing URI',
        name: 'MultiWebPostApi post function',
      );
      rethrow;
    } on SocketException {
      log(
        'Socket exception occurred',
        name: 'MultiWebPostApi post function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'MultiWebPostApi post function',
      );
      rethrow;
    }
  }
}
