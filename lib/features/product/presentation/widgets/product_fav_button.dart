import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/favorite_products.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/fetch_favorite_produts_provider.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductFavButton extends StatelessWidget {
  final Product product;
  const ProductFavButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        //for change screen state
        ref.watch(addRemoveFavoriteProductProvider);
        ref.watch(favoritesProvider);

        final read = ref.read(addRemoveFavoriteProductProvider.notifier);
        final favoriteRead = ref.read(favoritesProvider.notifier);

        final isSelectedChange = favoriteRead.isFavorite(product);
        return Positioned(
          top: 6,
          right: 6,
          child: CustomIconBackground(
            onPress: () {
              read.addOrRemoveProduct(product, isSelectedChange);
              favoriteRead.addRemoveToFavorites(product);
            },
            image:
                isSelectedChange
                    ? Assets.imagesSelectedHeart
                    : Assets.imagesHeart,
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
