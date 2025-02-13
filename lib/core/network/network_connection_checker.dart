import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkConnectionChecker {
  Future<bool> get isConnected;
}

class NetworkConnectionChacherImpl implements NetworkConnectionChecker {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkConnectionChacherImpl(
    this.internetConnectionChecker,
  );
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
