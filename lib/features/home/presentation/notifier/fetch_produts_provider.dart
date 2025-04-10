// Fetching favorite markets
import 'package:devsoluionstask/core/utils/helpers/getItLocator.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:devsoluionstask/features/home/data/repo/get_products_repo/products_repo.dart';
import 'package:riverpod/riverpod.dart';
final refreshTriggerProvider = StateProvider<int>((ref) => 0);

final fetchProductsProvider = FutureProvider.autoDispose<List<ProductResponse>>(
  (ref) async {
    // i added refresh for refreshing cus i faced and issue when i used ref.invalidate(fetchProductsProvider) on refreshIndicator function; 
  ref.watch(refreshTriggerProvider);
    return await getit.get<ProductsRepo>().getProducts();
  },
);