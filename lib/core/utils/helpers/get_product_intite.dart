import 'package:devsoluionstask/core/utils/dto/product.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';

Product getProductIntite(ProductResponse productResponse) {
  return Product(
    id: productResponse.id ?? 0,
    title: productResponse.title ?? '',
    price: productResponse.price ?? 0,
    description: productResponse.description ?? '',
    category: productResponse.category ?? '',
    image: productResponse.image ?? '',
    rating: productResponse.rating ?? Rating(rate: 0, count: 0),
  );
}
