import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_root.dart';
import 'package:flutter_recipe_app_course/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app_course/presentation/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app_course/presentation/profile/profile_screen.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_screen_root.dart';
import 'package:flutter_recipe_app_course/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app_course/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) {
        return SplashScreen(
          onStartCooking: () {
            context.go(RoutePaths.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder: (context, state) {
        return SignInScreen(
          onSignUp: () {
            context.go(RoutePaths.signUp);
          },
          onSignIn: () {
            context.go(RoutePaths.home);
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) {
        return SignUpScreen(
          onSignIn: () {
            context.go(RoutePaths.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.search,
      builder: (context, state) => const SearchScreenRoot(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          body: navigationShell,
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              builder: (context, state) {
                return const HomeRoot();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.savedRecipes,
              builder: (context, state) {
                return SavedRecipesRoot();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.notifications,
              builder: (context, state) {
                return const NotificationsScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.profile,
              builder: (context, state) {
                return const ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
