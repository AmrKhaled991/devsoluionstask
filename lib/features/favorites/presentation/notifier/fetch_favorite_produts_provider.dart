// Fetching favorite markets
import 'package:devsoluionstask/core/utils/helpers/getItLocator.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/add_remove_product_to_favorite_state.dart';
import 'package:devsoluionstask/features/product/data/repo/favorite_product_repo/favorite_product_repo.dart';
import 'package:riverpod/riverpod.dart';

final fetchFavoriteProductsProvider = FutureProvider.autoDispose<List<Product>>(
  (ref) async {
    return getit.get<FavoriteProductRepo>().getFavoriteProducts();
  },
);

final addRemoveFavoriteProductProvider = NotifierProvider<
  AddRemoveProductToFavoriteProvider,
  AddRemoveProductToFavoriteState
>(AddRemoveProductToFavoriteProvider.new);

class AddRemoveProductToFavoriteProvider
    extends Notifier<AddRemoveProductToFavoriteState> {
  final favoriteProductRepository = getit.get<FavoriteProductRepo>();

  @override
  AddRemoveProductToFavoriteState build() {
    return const AddRemoveProductToFavoriteInitial();
  }

  Future<void> addOrRemoveProduct(Product product, bool isAdd) async {
    state = const AddRemoveProductToFavoriteLoading();
    try {
      await favoriteProductRepository.addRemoveProductToFavorite(
        product,
        isAdd,
      );

      state = const AddRemoveProductToFavoriteSuccess();
    } catch (e) {
      state = AddRemoveProductToFavoriteError(e.toString());
    }
  }
}
