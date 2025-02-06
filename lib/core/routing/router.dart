import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/screen/saved_recipes_root.dart';
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
            context.go(RoutePaths.savedRecipes);
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
      path: RoutePaths.savedRecipes,
      builder: (context, state) {
        return SavedRecipesRoot();
      },
    )
  ],
);
