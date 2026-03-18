abstract class Failure {
  const Failure({required this.message});

  final String message;

  @override
  String toString() => '$runtimeType(message: $message)';
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message});
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({required super.message});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message});
}

class ConflictFailure extends Failure {
  const ConflictFailure({required super.message});
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    this.errors = const <String>[],
  });

  final List<String> errors;

  @override
  String toString() {
    return '$runtimeType(message: $message, errors: $errors)';
  }
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}
