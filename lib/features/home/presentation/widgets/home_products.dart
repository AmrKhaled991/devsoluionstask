import 'package:devsoluionstask/core/utils/helpers/get_product_intite.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/favorite_products.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () async => ref
          .read(favoritesProvider.notifier)
          .addALLProduct(await ref.read(fetchFavoriteProductsProvider.future)),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final watchFetchProductsProvider = ref.watch(fetchProductsProvider);
    return watchFetchProductsProvider.when(
      loading: () => const ProductsLoading(),
      data:
          (data) => GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
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
              );
            },
          ),
      error:
          (error, stackTrace) => AppError(
            error: error,
            tryAgain: () => ref.invalidate(fetchProductsProvider),
          ),
    );
  }
}
