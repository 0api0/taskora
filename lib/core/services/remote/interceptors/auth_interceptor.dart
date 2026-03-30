import 'package:dio/dio.dart';
import 'package:taskora/features/auth/data/datasources/local/auth_local_data_source.dart';

import '../api_constants.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authLocalDataSource);

  final AuthLocalDataSource _authLocalDataSource;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // check if i need add token in request
    final bool requiresAuth =
        options.extra[ApiConstants.requiresAuth] as bool? ?? false;

    if (!requiresAuth) {
      handler.next(options);
      return;
    }
    final String? token = _authLocalDataSource.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authorizationHeader] =
          '${ApiConstants.bearerPrefix} $token';
    }
    handler.next(options);
  }
}
