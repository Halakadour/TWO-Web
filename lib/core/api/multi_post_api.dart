import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../error/handling_exception_request.dart';

typedef FromJson<T> = T Function(String body);

class MultiPostApi with HandlingExceptionRequest {
  final Uri uri;
  final Map<String, String> body;
  final Map<String, File> images;
  final FromJson fromJson;
  final Duration timeout;
  final String token;

  const MultiPostApi({
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
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      for (var item in images.entries) {
        request.files
            .add(await http.MultipartFile.fromPath(item.key, item.value.path));
      }
      request.fields.addAll(body);
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
        'http exception',
        name: 'RequestManager post function',
      );
      rethrow;
    } on FormatException {
      log(
        'something went wrong in parsing the uri',
        name: 'RequestManager post function',
      );
      rethrow;
    } on SocketException {
      log(
        'socket exception',
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
