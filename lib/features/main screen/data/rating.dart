import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'rating.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Rating extends Equatable {
  @HiveField(0)
  final double? rate;

  @HiveField(1)
  final int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  List<Object?> get props => [rate, count];
}
