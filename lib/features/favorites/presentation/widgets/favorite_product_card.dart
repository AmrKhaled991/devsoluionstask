import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/widgets/custom_card.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteProductCard extends StatefulWidget {
  final Product product;
  final Function() onFavoriteIconTap;
  const FavoriteProductCard({
    super.key,
    required this.product,
    required this.onFavoriteIconTap,
  });

  @override
  State<FavoriteProductCard> createState() => _FavoriteProductCardState();
}

class _FavoriteProductCardState extends State<FavoriteProductCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: widget.product.image,
                  placeholder:
                      (context, url) => Skeletonizer(child: SizedBox()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 75,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        child: Text(
                          widget.product.title,
                          style: Styles.textSemiBold20(),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                      ),

                      Spacer(),
                      CustomIconBackground(
                        image: Assets.imagesSelectedHeart,
                        onPress: widget.onFavoriteIconTap,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${widget.product.price}EGP',
                    textAlign: TextAlign.right,
                    style: Styles.textSemiBold14(),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "stars",
                    textAlign: TextAlign.right,
                    style: Styles.textSemiBold12(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
