import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingSection extends StatelessWidget {
  final double rate;
  final int count;
  const RatingSection({
    super.key,
    required this.rate,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesStare, height: 16, width: 16),
        const SizedBox(width: 4),
        Text(
          rate.toString(),
          style: Styles.textSemiBold18().copyWith(color: SECONDRY),
        ),
        Text(
          '(${count.toString()})',
          style: Styles.textRegular12().copyWith(
            color: const Color(0xFF909090),
          ),
        ),
      ],
    );
  }
}
