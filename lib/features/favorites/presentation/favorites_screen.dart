import 'package:devsoluionstask/features/favorites/presentation/widgets/favorite_product_card.dart';
import 'package:devsoluionstask/features/widgets/search_and_notification_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),

          slivers: [
           
            SliverToBoxAdapter(
              child: SearchAndNotificationBar(searchController: controller),
            ),
            SliverFillRemaining(
              child: ListView.separated(
                itemBuilder: (context, index) => const FavoriteProductCard(),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 20),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
