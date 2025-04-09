import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/dto/product.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                    imageUrl: product.image,
                    placeholder:
                        (context, url) => Skeletonizer(child: SizedBox()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Text(
                product.title,
                style: Styles.textSemiBold12(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text('\$ ${product.price}', style: Styles.textSemiBold12()),
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
        Positioned(
          top: 6,
          right: 6,
          child: CustomIconBackground(
            onPress: () {},
            image: Assets.imagesPrimaryHeart,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
