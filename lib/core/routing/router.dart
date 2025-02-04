import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app_course/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/mock_bookmark_repository_impl.dart';
import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../domain/model/recipe.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../presentation/saved_recipes/saved_recipes_screen.dart';

final router = GoRouter(
  initialLocation: '/Splash',
  routes: [
    GoRoute(
      path: '/Splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/SignIn',
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/SavedRecipes',
      builder: (context, state) {
        return FutureBuilder<List<Recipe>>(
          future: GetSavedRecipesUseCase(
            recipeRepository: MockRecipeRepositoryImpl(),
            bookmarkRepository: MockBookmarkRepositoryImpl(),
          ).execute(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final recipes = snapshot.data!;

            return SavedRecipesScreen(
              recipes: recipes,
            );
          },
        );
      },
    )
  ],
);
