import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/models/product.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/product/presentation/widgets/product_color_and_rating.dart';
import 'package:devsoluionstask/features/widgets/custom_elevated_button.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CustomIconBackground(
                  icon: Icons.arrow_back_ios_rounded,
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                CustomIconBackground(image: Assets.imagesHeart, onPress: () {}),
                const SizedBox(width: 12),
                CustomIconBackground(image: Assets.imagesShare, onPress: () {}),
              ],
            ),
            const SizedBox(height: 20),
            CachedNetworkImage(
              imageUrl: product.image,
              placeholder: (context, url) => Skeletonizer(child: SizedBox()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 224,
              height: 236,
            ),
            const SizedBox(height: 36),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(product.title, style: Styles.textSemiBold24()),
            ),
            Row(
              children: [
                Text(
                  '\$ ${product.price}',
                  style: Styles.textSemiBold20().copyWith(color: PRIMARY),
                ),
                SizedBox(
                  height: 16,
                  child: VerticalDivider(
                    width: 16,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    '\$ ${product.description}',
                    maxLines: 1,
                    style: Styles.textRegular12(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ProductColorAndRating(),
            Divider(height: 40),
            CustomElevatedButton(
              buttonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(SECONDRY),
              ),
              text: "Add to cart",
              onPressed: () {},
            ),
            const SizedBox(height: 13),
            CustomElevatedButton(
              buttonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(PRIMARY),
              ),
              text: "Buy Now",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
