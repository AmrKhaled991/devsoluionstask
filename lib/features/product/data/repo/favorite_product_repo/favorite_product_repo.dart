import 'package:devsoluionstask/core/utils/models/product.dart';

abstract class FavoriteProductRepo {
  Future<void> addRemoveProductToFavorite(Product product);
  Future<List<Product>> getFavoriteProducts();
}
