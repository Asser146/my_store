import 'package:json_annotation/json_annotation.dart';
import 'package:my_store/features/main_screen/data/product.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  BaseResponse({this.products, this.total, this.skip, this.limit});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
