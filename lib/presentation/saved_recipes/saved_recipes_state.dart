import 'package:flutter_recipe_app_course/domain/model/recipe.dart';

class SavedRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;

  SavedRecipesState({
    required this.recipes,
    required this.isLoading,
  });

  SavedRecipesState copyWith({
    List<Recipe>? recipes,
    bool? isLoading,
  }) {
    return SavedRecipesState(
      recipes: recipes ?? this.recipes,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
