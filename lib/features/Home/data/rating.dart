import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Rating extends HiveObject {
  @HiveField(0)
  double? rate;
  @HiveField(1)
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
