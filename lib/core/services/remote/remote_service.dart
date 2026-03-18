import 'package:dio/dio.dart';
import 'package:taskora/core/extensions/http_method_extension.dart';

import 'error_handler/api_exception_mapper.dart';

enum HttpMethod { get, post, put, patch, delete }

class RemoteService {
  RemoteService({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Dio get client => _dio;

  // General request
  Future<Map<String, dynamic>> request({
    required HttpMethod method,
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Options requestOptions = (options ?? Options()).copyWith(
        method: method.value,
      );

      final Response<dynamic> response = await _dio.request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
      );

      return _parseResponse(response.data);
    } on DioException catch (exception) {
      throw ApiExceptionMapper.map(exception);
    }
  }

  Map<String, dynamic> _parseResponse(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }

    throw const FormatException('Response data is not a valid JSON object.');
  }
}

/*  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse(response.data);
    } on DioException catch (exception) {
      throw ApiExceptionMapper.map(exception);
    }
  }



  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse(response.data);
    } on DioException catch (exception) {
      throw ApiExceptionMapper.map(exception);
    }
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse(response.data);
    } on DioException catch (exception) {
      throw ApiExceptionMapper.map(exception);
    }
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.patch<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse(response.data);
    } on DioException catch (exception) {
      throw ApiExceptionMapper.map(exception);
    }
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.delete<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse(response.data);
    } on DioException catch (exception) {
      throw ApiExceptionMapper.map(exception);
    }
  }*/
