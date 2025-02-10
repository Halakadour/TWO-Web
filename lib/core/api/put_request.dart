import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../error/handling_exception_request.dart';
import 'get_api.dart';

class PutApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final Map body;
  final FromJson fromJson;
  final bool isLogin;
  final String token;
  final Duration timeout;

  const PutApi({
    required this.uri,
    required this.body,
    required this.token,
    required this.fromJson,
    this.isLogin = false,
    this.timeout = const Duration(seconds: 20),
  });

  Future<T> call() async {
    // String? token = await SharedPreferencesService.getToken();
    // String fcmToken = await HelperFunctions.getFCMToken();
    // bool isAuth = await SharedPreferencesService.isAuth();

    try {
      var headers = {
        'Content-Type': 'application/json',
        // 'fcm_token': fcmToken,
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request = http.Request('Put', uri);
      request.body = jsonEncode(body);
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(timeout);
      log(request.body, name: "request body");
      http.Response response = await http.Response.fromStream(streamedResponse);
      log(response.body);
      log(response.statusCode.toString());
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
