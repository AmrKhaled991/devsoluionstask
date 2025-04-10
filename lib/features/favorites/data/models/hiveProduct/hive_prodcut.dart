import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:hive/hive.dart';

part 'hive_prodcut.g.dart';

@HiveType(typeId: 1)
class HiveProduct extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double price;

  @HiveField(3)
  String description;

  @HiveField(4)
  String category;

  @HiveField(5)
  String image;

  @HiveField(6) 
  Rating rating;

  HiveProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

