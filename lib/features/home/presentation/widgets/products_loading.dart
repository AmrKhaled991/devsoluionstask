import 'package:devsoluionstask/core/utils/helpers/get_product_intite.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:devsoluionstask/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        mainAxisSpacing: 8, // spacing between rows
        crossAxisSpacing: 8,
        mainAxisExtent: 200, // spacing between columns
      ),
      itemCount: 10, // your item list
      itemBuilder: (context, index) {
        return Skeletonizer(
          child: ProductCard(product: getProductIntite(ProductResponse()),isFavorite: false,),
        );
      },
    );
  }
}
