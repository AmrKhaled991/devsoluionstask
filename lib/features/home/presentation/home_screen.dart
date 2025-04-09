import 'package:devsoluionstask/features/home/presentation/widgets/product_card.dart';
import 'package:devsoluionstask/features/widgets/search_and_notification_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SearchAndNotificationBar(
                searchController: controller,
                notification: true,
              ),
            ),
            SliverFillRemaining(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  mainAxisSpacing: 8, // spacing between rows
                  crossAxisSpacing: 8,
                  mainAxisExtent: 200, // spacing between columns
                ),
                itemCount: 5, // your item list
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
