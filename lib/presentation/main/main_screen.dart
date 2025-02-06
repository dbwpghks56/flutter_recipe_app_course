import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;
  const MainScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        onDestinationSelected: onChangeIndex,
        selectedIndex: currentPageIndex,
        destinations: const [
          const NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: ColorStyles.gray4,
            ),
            label: "home",
            selectedIcon: Stack(
              children: [
                Icon(
                  Icons.home,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.home_outlined,
                  color: ColorStyles.primary100,
                ),
              ],
            ),
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: ColorStyles.gray4,
            ),
            label: "bookmarks",
            selectedIcon: Stack(
              children: [
                Icon(
                  Icons.bookmark,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.bookmark_border_outlined,
                  color: ColorStyles.primary100,
                ),
              ],
            ),
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.notifications_outlined,
              color: ColorStyles.gray4,
            ),
            label: "notifications",
            selectedIcon: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: ColorStyles.primary100,
                ),
              ],
            ),
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.person_2_outlined,
              color: ColorStyles.gray4,
            ),
            label: "profile",
            selectedIcon: Stack(
              children: [
                Icon(
                  Icons.person_2,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.person_2_outlined,
                  color: ColorStyles.primary100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
