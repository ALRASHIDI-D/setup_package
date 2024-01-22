import 'package:common_setup/core/utils/entities/customize_app_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'core/api_helper/api_consumer.dart';
import 'core/api_helper/dio_provider.dart';
import 'core/cache_helper/cache_helper.dart';

final sl = GetIt.instance;
Future<void> init(CustomizeAppEntity customizeAppEntity) async {
  sl.registerLazySingleton<CustomizeAppEntity>(() => CustomizeAppEntity(
      stagingBaseUrl: customizeAppEntity.stagingBaseUrl,
      prodBaseUrl: customizeAppEntity.prodBaseUrl,
      primaryColor: customizeAppEntity.primaryColor,
      secondColor: customizeAppEntity.secondColor,
      appUseToken: customizeAppEntity.appUseToken ?? false,
      defualtPadding: customizeAppEntity.defualtPadding,
      defualtRadius: customizeAppEntity.defualtRadius,
      tokenKeyUsedInApp: customizeAppEntity.tokenKeyUsedInApp ?? ''));

  // ------------------------------------------------------CORE------------------------------------------------------
  AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  final secureLocalStorage =
      FlutterSecureStorage(aOptions: getAndroidOptions());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<FlutterSecureStorage>(() => secureLocalStorage);
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(storage: sl()));
  sl.registerLazySingleton<ApiConsumer>(
      () => DioProvider(dioClient: sl(), cacheHelper: sl()));
}
