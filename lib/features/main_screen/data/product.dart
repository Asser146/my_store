import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_store/features/main_screen/data/review.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Product {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? category;

  @HiveField(4)
  double? price;

  @HiveField(5)
  double? discountPercentage;

  @HiveField(6)
  double? rating;

  @HiveField(7)
  int? stock;

  @HiveField(8)
  List<String>? tags;

  @HiveField(9)
  String? brand;

  @HiveField(10)
  String? sku;

  @HiveField(11)
  int? weight;

  @HiveField(12)
  String? warrantyInformation;

  @HiveField(13)
  String? shippingInformation;

  @HiveField(14)
  String? availabilityStatus;

  @HiveField(15)
  List<Review>? reviews;

  @HiveField(16)
  String? returnPolicy;

  @HiveField(17)
  int? minimumOrderQuantity;

  @HiveField(18)
  List<String>? images;

  @HiveField(19)
  String? thumbnail;

  Product({
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
    this.sku,
    this.weight,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.images,
    this.thumbnail,
  });

  // The copyWith method
  Product copyWith({
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
    String? sku,
    int? weight,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    List<String>? images,
    String? thumbnail,
  }) {
    return Product(
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
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  // JSON serialization
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
