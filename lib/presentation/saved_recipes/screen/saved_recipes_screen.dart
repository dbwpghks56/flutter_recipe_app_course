import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

import '../../../core/presentation/components/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const SavedRecipesScreen({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Recipes",
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                recipe: recipes[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
