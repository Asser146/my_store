import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_store/features/Home/data/rating.dart';

part 'item.g.dart';

@HiveType(typeId: 0) // Specify a unique typeId for Hive
@JsonSerializable()
class Item {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  double? price;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? image;

  @HiveField(6)
  Rating? rating;

  Item({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
