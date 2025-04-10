import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/widgets/custom_card.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';

class FavoriteProductCard extends StatelessWidget {
  final Product product;
  const FavoriteProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                Assets.imagesPngsound,
                fit: BoxFit.contain,
                height: 100,
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product.title,
                        textAlign: TextAlign.right,
                        style: Styles.textSemiBold20(),
                      ),
                      Spacer(),
                      CustomIconBackground(
                        image: Assets.imagesHeart,
                        onPress: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${product.price}EGP',
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
