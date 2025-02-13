import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/filter/filter_state.dart';
import 'package:flutter_recipe_app_course/domain/repository/recent_search_repository.dart';
import 'package:flutter_recipe_app_course/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_state.dart';

class SearchViewModel extends ChangeNotifier {
  final RecentSearchRepository _recentSearchRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchViewModel({
    required RecentSearchRepository recentSearchRepository,
    required SearchRecipesUseCase searchRecipesUseCase,
  })  : _recentSearchRepository = recentSearchRepository,
        _searchRecipesUseCase = searchRecipesUseCase {
    _loadRecentSearchRecipes();
  }

  SearchState _state = SearchState();

  SearchState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _recentSearchRepository.getRecentSearchRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final _recipes = await await _searchRecipesUseCase.execute(query);

    _state = _state.copyWith(
      recipes: _recipes,
      isLoading: false,
      searchTitle: "Search Results",
      resultsCount: "${_recipes.length} results",
    );
    notifyListeners();
  }

  void onChangeFilter(FilterState filterState) async {
    _state = _state.copyWith(filterState: filterState);
    notifyListeners();
  }
}
