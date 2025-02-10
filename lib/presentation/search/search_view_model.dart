import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/repository/recent_search_repository.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_state.dart';

class SearchViewModel extends ChangeNotifier {
  final RecentSearchRepository _recentSearchRepository;

  SearchViewModel({
    required RecentSearchRepository recentSearchRepository,
  }) : _recentSearchRepository = recentSearchRepository {
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
}
