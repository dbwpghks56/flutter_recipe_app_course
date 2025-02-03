import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

import '../repository/bookmark_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  const GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  })  : _recipeRepository = recipeRepository,
        _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> execute() async {
    final ids = await _bookmarkRepository.getBookmarkIds();
    final recipes = await _recipeRepository.getRecipes();

    return recipes.where((recipe) => ids.contains(recipe.id)).toList();
  }
}
