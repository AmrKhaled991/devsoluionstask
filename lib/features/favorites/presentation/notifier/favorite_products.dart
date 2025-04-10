import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Favorites provider
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Product>>(
      (ref) => FavoritesNotifier(),
    );

class FavoritesNotifier extends StateNotifier<List<Product>> {
  FavoritesNotifier() : super([]);

  void addALLProduct(List<Product> products) {
    state = products;
    print("state.length ${state.length}");
  }

  void addRemoveToFavorites(Product product) {
    if (!state.any((item) => item.id == product.id)) {
      state = [...state, product];
    } else {
      state = state.where((item) => item.id != product.id).toList();
    }
  }

  bool isFavorite(Product product) {
    return state.any((item) => item.id == product.id);
  }
}
