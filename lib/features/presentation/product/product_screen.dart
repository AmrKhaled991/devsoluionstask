import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/presentation/product/widgets/product_color_and_rating.dart';
import 'package:devsoluionstask/features/widgets/custom_elevated_button.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
                  onPress: () {},
                ),
                Spacer(),
                CustomIconBackground(image: Assets.imagesHeart, onPress: () {}),
                const SizedBox(width: 12),
                CustomIconBackground(image: Assets.imagesShare, onPress: () {}),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(Assets.imagesPngsound),
            const SizedBox(height: 36),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('Sony WH-1000XM5', style: Styles.textSemiBold24()),
            ),
            Row(
              children: [
                Text(
                  '\$ 4.999',
                  style: Styles.textSemiBold20().copyWith(color: PRIMARY),
                ),
                VerticalDivider(
                  width: 16,
                  thickness: 1,
                  indent: 16,
                  endIndent: 0,
                  color: Colors.grey,
                ),
                Text(
                  'Including taxes and duties',
                  style: Styles.textRegular12(),
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
