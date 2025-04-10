import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/data/models/hiveProduct/hive_prodcut.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';

import '../../../features/home/data/models/rating.dart';

Product getProductIntite(ProductResponse productResponse) {
  return Product(
    id: productResponse.id ?? 0,
    title: productResponse.title ?? '',
    price: productResponse.price ?? 0,
    description: productResponse.description ?? '',
    category: productResponse.category ?? '',
    image: productResponse.image ?? '',
    rating: productResponse.rating ?? ProductRating(rate: 0, count: 0) ,
  );
}
