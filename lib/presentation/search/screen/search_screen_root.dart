import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/data/data_source/local/local_recent_search_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recent_search_repository_impl.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_view_model.dart';

final _recentSearchRepository = MockRecentSearchRepositoryImpl(
  recipeDataSource: LocalRecentSearchRecipeDataSourceImpl(),
);

class SearchScreenRoot extends StatelessWidget {
  const SearchScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRepository: _recentSearchRepository,
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        final state = viewModel.state;

        return SearchScreen(state: state);
      },
    );
  }
}
