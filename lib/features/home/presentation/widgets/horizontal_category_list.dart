import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryList extends StatelessWidget {
  final List<String> categories = [
    'Technology',
    'Fashion',
    'Sports',
    'Supermarket',
    'Health',
    'Beauty',
    'Home',
  ];

  HorizontalCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(62),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Center(
              child: Text(categories[index], style: Styles.textSemiBold14()),
            ),
          );
        },
      ),
    );
  }
}
