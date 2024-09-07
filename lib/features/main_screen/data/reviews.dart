import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Reviews {
  @HiveField(0)
  double? rating;
  @HiveField(1)
  String? comment;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? reviewerName;
  @HiveField(4)
  String? reviewerEmail;

  Reviews(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
