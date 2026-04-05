import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taskora/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:taskora/features/auth/domain/repositories/auth_session_manager_store.dart';

import '../api_constants.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authSessionStore, this._authLocalDataSource);

  final AuthSessionStore _authSessionStore;
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

    final String? token =
        _authSessionStore.token ?? _authLocalDataSource.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authorizationHeader] =
          '${ApiConstants.bearerPrefix} $token';
    }
    handler.next(options);
  }
}
