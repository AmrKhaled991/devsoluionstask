import 'package:devsoluionstask/core/utils/helpers/get_product_intite.dart';
import 'package:devsoluionstask/features/favorites/presentation/widgets/favorite_product_card.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavProductsLoading extends StatelessWidget {
  const FavProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) => Skeletonizer(
            child: FavoriteProductCard(
              product: getProductIntite(ProductResponse()),
              onFavoriteIconTap: () {
                
              },
            ),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 10,
    );
  }
}
