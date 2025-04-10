import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/data/models/hiveProduct/hive_prodcut.dart';
import 'package:devsoluionstask/features/product/data/repo/favorite_product_repo/favorite_product_repo.dart';
import 'package:hive/hive.dart';

class FavoriteProductRepoImp implements FavoriteProductRepo {
  final favProduct = Hive.box<HiveProduct>('favoriteProduct');
  @override
  Future<void> addRemoveProductToFavorite(Product product) async {
    if (favProduct.containsKey(product.id)) {
      return favProduct.delete(product.id);
    }else{
      return favProduct.put(product.id,product.productToHive(product));
    }
  }

  @override
  Future<List<Product>> getFavoriteProducts() async {
    return favProduct.values
        .map(
          (e) => Product(
            id: e.id,
            title: e.title,
            price: e.price,
            description: e.description,
            category: e.category,
            image: e.image,
            rating: e.rating,
          ),
        )
        .toList();
  }
}
