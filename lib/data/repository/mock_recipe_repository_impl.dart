import 'package:flutter_recipe_app_course/domain/data_source/recipe_data_source.dart';

import '../../domain/model/recipe.dart';
import '../../domain/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const MockRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipe(int id) async {
    final recipes = await getRecipes();

    return recipes.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(const Duration(microseconds: 500));

    final recipes = await _recipeDataSource.getRecipes();

    return recipes.map((e) => Recipe.fromJson(e)).toList();
  }
}
