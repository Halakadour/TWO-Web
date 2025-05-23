import 'dart:io';

import 'package:http/http.dart' as http;

import '../error/handling_exception_request.dart';

typedef FromJson<T> = T Function(String body);

class GetApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final FromJson fromJson;
  final bool getFCMToken;

  GetApi({
    required this.uri,
    required this.fromJson,
    this.getFCMToken = false,
  });

  Future<T> callRequest() async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var request = http.Request('GET', uri);
      request.headers.addAll(headers);

      // Send the request
      http.StreamedResponse streamedResponse =
          await request.send().timeout(const Duration(seconds: 40));
      http.Response response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    } on SocketException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
