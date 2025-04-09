import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductColorAndRating extends StatefulWidget {
  const ProductColorAndRating({super.key});

  @override
  State<ProductColorAndRating> createState() => _ProductColorAndRatingState();
}

class _ProductColorAndRatingState extends State<ProductColorAndRating> {
  int selectedIndex = 0;
  final List<Color> colors = [
    Colors.black,
    const Color(0xFFD6CFC4),
    const Color(0xFFDADADA),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: List.generate(colors.length, (index) {
            final bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Center(
                child: Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        isSelected
                            ? Border.all(color: Colors.black, width: 2)
                            : null,
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: colors[index],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),

        Row(
          children: [
            SvgPicture.asset(Assets.imagesStare, height: 16, width: 16),
            const SizedBox(width: 4),
            Text(
              '4.8',
              style: Styles.textSemiBold18().copyWith(color: SECONDRY),
            ),
            Text(
              '(231)',
              style: Styles.textRegular12().copyWith(
                color: const Color(0xFF909090),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
