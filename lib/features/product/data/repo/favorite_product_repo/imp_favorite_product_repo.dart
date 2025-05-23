import 'package:devsoluionstask/core/utils/constants/box_constants.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/data/models/hiveProduct/hive_prodcut.dart';
import 'package:devsoluionstask/features/home/data/models/rating.dart';
import 'package:devsoluionstask/features/product/data/repo/favorite_product_repo/favorite_product_repo.dart';
import 'package:hive/hive.dart';

class FavoriteProductRepoImp implements FavoriteProductRepo {
  @override
  Future<void> addRemoveProductToFavorite(Product product, bool isAdd) async {
    final favProduct = Hive.box<HiveProduct>(BoxConstants.favoritesBox);

    if (isAdd) {
      Future.delayed(
        const Duration(milliseconds: 200),
      ).then((_) => favProduct.delete(product.id));
    } else {

      Future.delayed(
        const Duration(milliseconds: 200),
      ).then((_) => favProduct.put(product.id, product.productToHive(product)));
    }
  }

  @override
  Future<List<Product>> getFavoriteProducts() async {
    final favProduct = Hive.box<HiveProduct>(BoxConstants.favoritesBox);
    return favProduct.values
        .map(
          (e) => Product(
            id: e.id,
            title: e.title,
            price: e.price,
            description: e.description,
            category: e.category,
            image: e.image,
            rating: ProductRating(rate: e.rating.rate, count: e.rating.count) ,
          ),
        )
        .toList();
  }
}
