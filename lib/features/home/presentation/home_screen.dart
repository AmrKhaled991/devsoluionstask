import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/home/presentation/notifier/fetch_produts_provider.dart';
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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
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
                  ref.read(refreshTriggerProvider.notifier).state++;
                },
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      expandedHeight: 200,
                      floating: false,
                      pinned: false,
                      elevation: 0.0,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(Assets.imagesBanner),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: HorizontalCategoryList(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Recently viewed',
                            style: Styles.textSemiBold16(),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: HomeProducts()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
