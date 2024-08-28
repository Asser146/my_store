import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/dio_factory.dart';
import 'package:my_store/features/main_screen/domain/hive_services.dart';
import 'package:my_store/features/main_screen/domain/item_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<ItemRepository>(() => ItemRepository());
  getIt.registerLazySingleton<HiveServices>(() => HiveServices());
}
