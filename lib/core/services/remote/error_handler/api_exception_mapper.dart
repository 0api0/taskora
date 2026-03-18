import 'dart:io';

import 'package:dio/dio.dart';

import 'api_error_model.dart';
import 'api_exception.dart';

abstract final class ApiExceptionMapper {
  // helper methode
  static bool _isNetworkException(DioException exception) {
    return exception.type == DioExceptionType.connectionError &&
        exception.error is SocketException;
  }

  static bool _isTimeoutException(DioException exception) {
    return exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout;
  }

  static ApiErrorModel? _parseApiError(dynamic data) {
    if (data is Map<String, dynamic>) {
      return ApiErrorModel.fromJson(data);
    }

    return null;
  }

  // Mapper exception
  static ApiException map(DioException exception) {
    if (_isNetworkException(exception)) {
      return const NetworkException(
        message: 'No internet connection. Please try again.',
      );
    }

    if (_isTimeoutException(exception)) {
      return const NetworkException(
        message: 'Connection timed out. Please try again.',
      );
    }

    final int? statusCode = exception.response?.statusCode;
    final ApiErrorModel? apiError = _parseApiError(exception.response?.data);

    switch (statusCode) {
      case 400:
        return ValidationException(
          message: apiError?.message ?? 'Validation error',
          statusCode: statusCode,
          errors: apiError?.errors ?? const <String>[],
        );
      case 401:
        return UnauthorizedException(
          message: apiError?.message ?? 'Unauthorized',
          statusCode: statusCode,
        );
      case 403:
        return ForbiddenException(
          message: apiError?.message ?? 'Forbidden',
          statusCode: statusCode,
        );
      case 404:
        return NotFoundException(
          message: apiError?.message ?? 'Resource not found',
          statusCode: statusCode,
        );
      case 409:
        return ConflictException(
          message: apiError?.message ?? 'Conflict occurred',
          statusCode: statusCode,
        );
      default:
        if (statusCode != null && statusCode >= 500) {
          return ServerException(
            message: apiError?.message ?? 'Server error occurred',
            statusCode: statusCode,
          );
        }

        return UnknownApiException(
          message: apiError?.message ?? 'Unexpected error occurred',
          statusCode: statusCode,
        );
    }
  }
}
