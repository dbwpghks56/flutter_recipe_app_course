import 'package:flutter_recipe_app_course/domain/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/recent_search_repository.dart';

class MockRecentSearchRepositoryImpl implements RecentSearchRepository {
  final RecipeDataSource _recipeDataSource;

  const MockRecentSearchRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    final recipes = await _recipeDataSource.getRecipes();

    return recipes.map((e) => Recipe.fromJson(e)).toList();
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) {
    // TODO: implement updateRecentSearchRecipes
    throw UnimplementedError();
  }
}
