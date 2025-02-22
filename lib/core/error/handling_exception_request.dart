import 'dart:convert';

import 'package:http/http.dart';

import 'exceptions.dart';

mixin HandlingExceptionRequest {
  Exception getException({required Response response}) {
    final String message = json.decode(response.body)['msg'] ?? "error";

    return ServerException(message: message);
  }
}
