import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_constants.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.products)
  Future<List<Item>> getAllProducts();
}
