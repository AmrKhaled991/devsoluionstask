import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/favorites/presentation/notifier/fetch_produts_provider.dart';
import 'package:devsoluionstask/features/home/presentation/widgets/home_products.dart';
import 'package:devsoluionstask/features/home/presentation/widgets/horizontal_category_list.dart';
import 'package:devsoluionstask/features/widgets/search_and_notification_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
        child: Column(
          children: [
            SearchAndNotificationBar(
              searchController: controller,
              notification: true,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  return ref.invalidate(fetchProductsProvider);
                },
                child: NestedScrollView(
                  headerSliverBuilder:
                      (context, innerBoxIsScrolled) => [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.transparent,
                          automaticallyImplyLeading: false,
                          expandedHeight: 200,
                          floating: false,
                          pinned: false,
                          elevation: 0.0,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode:
                                CollapseMode
                                    .parallax, // Smooth scrolling effect
                            background: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Image.asset(Assets.imagesBanner),
                            ),
                          ),
                        ),
                      ],
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: HorizontalCategoryList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Recently viewed',
                            style: Styles.textSemiBold16(),
                          ),
                        ),
                      ),

                      Expanded(child: HomeProducts()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
