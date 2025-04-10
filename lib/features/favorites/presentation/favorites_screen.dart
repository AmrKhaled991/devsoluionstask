import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/fetch_favorite_produts_provider.dart';
import 'package:devsoluionstask/features/favorites/presentation/widgets/fav_products_loading.dart';
import 'package:devsoluionstask/features/favorites/presentation/widgets/favorite_product_card.dart';
import 'package:devsoluionstask/features/home/presentation/widgets/app_error_widget.dart';
import 'package:devsoluionstask/features/widgets/search_and_notification_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(fetchFavoriteProductsProvider);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: RefreshIndicator(
        onRefresh: () async => ref.invalidate(fetchFavoriteProductsProvider),

        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SearchAndNotificationBar(searchController: controller),
            ),
            SliverFillRemaining(
              child: products.when(
                data: (data) => ListOfFavoriteProducts(data: data),
                error:
                    (error, stackTrace) => AppError(
                      error: error,
                      tryAgain:
                          () => ref.invalidate(fetchFavoriteProductsProvider),
                    ),
                loading: FavProductsLoading.new,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListOfFavoriteProducts extends ConsumerStatefulWidget {
  final List<Product> data;
  const ListOfFavoriteProducts({super.key, required this.data});

  @override
  _ListOfFavoriteProductsState createState() => _ListOfFavoriteProductsState();
}

class _ListOfFavoriteProductsState
    extends ConsumerState<ListOfFavoriteProducts> {
  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(addRemoveFavoriteProductProvider);
    final read = ref.read(addRemoveFavoriteProductProvider.notifier);
    return ListView.separated(
      itemBuilder:
          (context, index) => FavoriteProductCard(
            product: widget.data[index],
            onFavoriteIconTap: () {
              read.addOrRemoveProduct(widget.data[index], true);
              widget.data.remove(widget.data[index]);
            },
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: widget.data.length,
    );
  }
}
