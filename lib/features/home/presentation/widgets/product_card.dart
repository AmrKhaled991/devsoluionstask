import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.asset(
                Assets
                    .imagesPngsound, // Make sure this image is in your assets folder
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text('Macbook Air M1', style: Styles.textSemiBold12()),
          const SizedBox(height: 8),
          Text('\$ 29,999', style: Styles.textSemiBold12()),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Free shipping',
              style: Styles.textSemiRegular8().copyWith(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
