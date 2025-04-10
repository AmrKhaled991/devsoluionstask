// Fetching favorite markets
import 'package:devsoluionstask/core/utils/helpers/getItLocator.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:devsoluionstask/features/home/data/repo/get_products_repo/products_repo.dart';
import 'package:riverpod/riverpod.dart';

final fetchProductsProvider = FutureProvider.autoDispose<List<ProductResponse>>(
  (ref) async {
    print('fetching products');
    return getit.get<ProductsRepo>().getProducts();
  },
);
