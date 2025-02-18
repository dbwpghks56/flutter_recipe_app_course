import 'package:flutter_recipe_app_course/domain/filter/filter_state.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  factory SearchState({
    @Default(const []) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default("Recent Search") String searchTitle,
    @Default("") String resultsCount,
    @Default(
      FilterState(
        time: "ALl",
        rate: 5,
        category: "ALl",
      ),
    )
    FilterState filterState,
  }) = _SearchState;
}
