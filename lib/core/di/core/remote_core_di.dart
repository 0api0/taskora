import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../services/remote/dio_client.dart';
import '../../services/remote/remote_service.dart';

void setUpRemoteCoreDi(GetIt sl) {
  sl.registerLazySingleton<DioClient>(() => const DioClient());

  sl.registerLazySingleton<Dio>(() => sl<DioClient>().create());

  sl.registerLazySingleton<RemoteService>(() => RemoteService(dio: sl<Dio>()));
}
