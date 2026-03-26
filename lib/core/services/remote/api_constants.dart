abstract final class ApiConstants {
  static const String baseUrl = 'https://api.mohammedzomlot.dev';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 20);
  static const Duration sendTimeout = Duration(seconds: 20);

  // Header keys
  static const String authorizationHeader = 'Authorization';
  static const String contentTypeHeader = 'Content-Type';
  static const String acceptHeader = 'Accept';

  // Header values
  static const String applicationJson = 'application/json';
  static const String bearerPrefix = 'Bearer';
  static const String requiresAuth = 'requiresAuth';
}
