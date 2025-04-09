import 'package:devsoluionstask/core/utils/helpers/get_product_intite.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/fetch_produts_provider.dart';
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
  Widget build(BuildContext context) {
    print('--------');
    final watch = ref.watch(fetchProductsProvider);

    return watch.when(
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
              return ProductCard(product: getProductIntite(data[index]));
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
