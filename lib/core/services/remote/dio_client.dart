import 'package:dio/dio.dart';

import 'api_constants.dart';

class DioClient {
  const DioClient();

  Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: const <String, dynamic>{
          ApiConstants.acceptHeader: ApiConstants.applicationJson,
          ApiConstants.contentTypeHeader: ApiConstants.applicationJson,
        },
      ),
    );
  }
}
