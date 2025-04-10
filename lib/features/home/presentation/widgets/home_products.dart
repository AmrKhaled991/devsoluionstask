import 'package:devsoluionstask/core/utils/helpers/get_product_intite.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/fetch_favorite_produts_provider.dart';
import 'package:devsoluionstask/features/home/presentation/notifier/fetch_produts_provider.dart';
import 'package:devsoluionstask/features/home/presentation/widgets/app_error_widget.dart';
import 'package:devsoluionstask/features/home/presentation/widgets/product_card.dart';
import 'package:devsoluionstask/features/home/presentation/widgets/products_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProducts extends ConsumerStatefulWidget {
  const HomeProducts({super.key});

  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends ConsumerState<HomeProducts> {
  List<Product> favoriteProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () async =>
          favoriteProducts =
              await ref
                  .read(favoriteProductProvider.notifier)
                  .favoriteProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final watchFetchProductsProvider = ref.watch(fetchProductsProvider);
    return watchFetchProductsProvider.when(
      data:
          (data) => GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200,
            ),
            itemCount: data.length, // your item list
            itemBuilder: (context, index) {
              return ProductCard(
                product: getProductIntite(data[index]),
                isFavorite: favoriteProducts.any(
                  (element) => element.id == data[index].id,
                ),
              );
            },
          ),
      error:
          (error, stackTrace) => AppError(
            error: error,
            tryAgain: () => ref.invalidate(fetchProductsProvider),
          ),
      loading: () => const ProductsLoading(),
    );
  }
}
