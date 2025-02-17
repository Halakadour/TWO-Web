class ServerException implements Exception {
  final String message;
  ServerException({
    required this.message,
  });
}

class EmptyCacheException implements Exception {
  final String message;
  EmptyCacheException({
    required this.message,
  });
}
