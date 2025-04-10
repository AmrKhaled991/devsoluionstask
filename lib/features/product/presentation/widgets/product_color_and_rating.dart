import 'package:devsoluionstask/features/home/data/models/rating.dart';
import 'package:devsoluionstask/features/product/presentation/widgets/rating_section.dart';
import 'package:flutter/material.dart';

class ProductColorAndRating extends StatefulWidget {
  final ProductRating rating;
  const ProductColorAndRating({super.key, required this.rating});

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

        RatingSection(rate: widget.rating.rate, count: widget.rating.count),
      ],
    );
  }
}
