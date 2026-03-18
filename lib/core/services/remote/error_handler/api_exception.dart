abstract class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      '$runtimeType(statusCode: $statusCode, message: $message)';
}

class NetworkException extends ApiException {
  const NetworkException({required super.message, super.statusCode});
}

class ServerException extends ApiException {
  const ServerException({required super.message, super.statusCode});
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({required super.message, super.statusCode});
}

class ForbiddenException extends ApiException {
  const ForbiddenException({required super.message, super.statusCode});
}

class NotFoundException extends ApiException {
  const NotFoundException({required super.message, super.statusCode});
}

class ConflictException extends ApiException {
  const ConflictException({required super.message, super.statusCode});
}

class ValidationException extends ApiException {
  const ValidationException({
    required super.message,
    super.statusCode,
    this.errors = const [],
  });

  final List<String> errors;

  @override
  String toString() {
    return '$runtimeType('
        'statusCode: $statusCode, '
        'message: $message, '
        'errors: $errors'
        ')';
  }
}

class UnknownApiException extends ApiException {
  const UnknownApiException({required super.message, super.statusCode});
}
