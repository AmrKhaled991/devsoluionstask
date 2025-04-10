import 'package:devsoluionstask/core/utils/models/product.dart';

abstract class FavoriteProductRepo {
  Future<void> addRemoveProductToFavorite(Product product, bool isAdd);
  Future<List<Product>> getFavoriteProducts();
}
