import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_store/features/main_screen/data/reviews.dart';

part 'item.g.dart'; // Assuming you are using json_serializable

@HiveType(typeId: 0) // Specify a unique typeId for Hive
@JsonSerializable()
class Item extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? category;
  @HiveField(4)
  final double? price;
  @HiveField(5)
  final double? discountPercentage;
  @HiveField(6)
  final double? rating;
  @HiveField(7)
  final int? stock;
  @HiveField(8)
  final List<String>? tags;
  @HiveField(9)
  final String? brand;
  @HiveField(10)
  final String? warrantyInformation;
  @HiveField(11)
  final String? availabilityStatus;
  @HiveField(12)
  final List<Reviews>? reviews;
  @HiveField(13)
  final String? returnPolicy;
  @HiveField(14)
  final List<String>? images;
  @HiveField(15)
  final String? thumbnail;
  const Item({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.warrantyInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.images,
    this.thumbnail,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        price,
        discountPercentage,
        rating,
        stock,
        tags,
        brand,
        warrantyInformation,
        availabilityStatus,
        reviews,
        returnPolicy,
        images,
        thumbnail,
      ];

  Item copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? warrantyInformation,
    String? availabilityStatus,
    List<Reviews>? reviews,
    String? returnPolicy,
    List<String>? images,
    String? thumbnail,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
