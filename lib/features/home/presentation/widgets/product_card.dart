import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/fetch_favorite_produts_provider.dart';
import 'package:devsoluionstask/features/product/presentation/product_screen.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatefulWidget {
  final bool isFavorite;
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool? isSelectedChange;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: widget.product),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: APPGRAY,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Product Image
                SizedBox(
                  height: 122,
                  width: 73,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.image,
                      placeholder:
                          (context, url) => Skeletonizer(child: SizedBox()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  widget.product.title,
                  style: Styles.textSemiBold12(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '\$ ${widget.product.price}',
                  style: Styles.textSemiBold12(),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Free shipping',
                    style: Styles.textSemiRegular8().copyWith(
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final watch = ref.watch(addRemoveFavoriteProductProvider);
              final read = ref.read(addRemoveFavoriteProductProvider.notifier);
              return Positioned(
                top: 6,
                right: 6,
                child: CustomIconBackground(
                  onPress: () {
                    isSelectedChange = !(isSelectedChange ?? widget.isFavorite);
                    read.addOrRemoveProduct(widget.product, isSelectedChange!);
                  },
                  image:
                      isSelectedChange ?? widget.isFavorite
                          ? Assets.imagesSelectedHeart
                          : Assets.imagesPrimaryHeart,
                  backgroundColor: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
