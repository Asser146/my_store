import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_constants.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.products)
  Future<List<Item>> getAllProducts();

  @GET(ApiConstants.categories)
  Future<List<String>> getCategories();

  @GET(ApiConstants.limit5)
  Future<List<Item>> limit5Products();
}
