import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:my_store/features/main%20screen/data/rating.dart';

part 'item.g.dart';

@HiveType(typeId: 0) // Specify a unique typeId for Hive
@JsonSerializable()
class Item extends Equatable {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final double? price;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? category;

  @HiveField(5)
  final String? image;

  @HiveField(6)
  final Rating? rating;

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

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];

  // Copy method
  Item copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}
