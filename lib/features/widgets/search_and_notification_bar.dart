import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/favorites/presentation/favorites_screen.dart';
import 'package:devsoluionstask/features/widgets/custom_icon_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchAndNotificationBar extends StatelessWidget {
  final TextEditingController searchController;
  final bool notification;
  const SearchAndNotificationBar({
    super.key,
    required this.searchController,
    this.notification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Functional Search Field
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesSearch, height: 16, width: 16),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      hintText: 'Search products',
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: Styles.textSemiRegular14(),
                    onChanged: (value) {
                      print("Searching: $value");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (notification) ...[
          const SizedBox(width: 12),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomIconBackground(
                onPress: () {},
                image: Assets.imagesNotification,
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
