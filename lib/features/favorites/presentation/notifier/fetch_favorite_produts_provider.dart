// Fetching favorite markets
import 'package:devsoluionstask/core/utils/helpers/getItLocator.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/add_remove_product_to_favorite_state.dart';
import 'package:devsoluionstask/features/product/data/repo/favorite_product_repo/favorite_product_repo.dart';
import 'package:riverpod/riverpod.dart';

final favoriteProductProvider = NotifierProvider<
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

  Future<List<Product>> favoriteProducts() async {
    state = const AddRemoveProductToFavoriteLoading();
    try {
      return favoriteProductRepository.getFavoriteProducts();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addOrRemoveProduct(Product product , bool isAdd) async {
    state = const AddRemoveProductToFavoriteLoading();
    try {
      await favoriteProductRepository.addRemoveProductToFavorite(product, isAdd);

      state = const AddRemoveProductToFavoriteSuccess();
    } catch (e) {
      state = AddRemoveProductToFavoriteError(e.toString());
    }
  }
}
