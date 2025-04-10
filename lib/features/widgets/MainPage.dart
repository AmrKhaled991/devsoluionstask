import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/utils/theme/App_assets.dart';
import 'package:devsoluionstask/core/utils/theme/Styles.dart';
import 'package:devsoluionstask/features/favorites/presentation/favorites_screen.dart';
import 'package:devsoluionstask/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [HomeScreen(), EmptyScreen(), FavoritesScreen(), EmptyScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesSelectedHomesvg),
        inactiveIcon: Icon(Icons.home_filled),

        activeColorPrimary: PRIMARY,
        inactiveColorPrimary: Colors.grey,
        title: "Home",
        textStyle: Styles.textSemiBold14(),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesProducts, color: Colors.grey),
        activeColorPrimary: PRIMARY,
        inactiveColorPrimary: Colors.grey,
        title: "Products",
        textStyle: Styles.textSemiBold14(),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesSelectedHeart),
        inactiveIcon: SvgPicture.asset(Assets.imagesHeart),
        activeColorPrimary: PRIMARY,
        inactiveColorPrimary: Colors.grey,
        title: "Favorites",
        textStyle: Styles.textSemiBold14(),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesSettings, color: Colors.grey),
        activeColorPrimary: PRIMARY,
        inactiveColorPrimary: Colors.grey,
        title: "Settings",
        textStyle: Styles.textSemiBold14(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
       
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style1,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
    );
  }
}

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Empty Screen'));
  }
}
