abstract class Failure {
  final String message;
  Failure({
    required this.message,
  });
}

class OffLineFailure extends Failure {
  OffLineFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure({required super.message});
}

class WrongDataFailure extends Failure {
  WrongDataFailure({required super.message});
}
