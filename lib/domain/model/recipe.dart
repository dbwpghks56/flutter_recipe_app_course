import 'package:flutter_recipe_app_course/domain/model/recipe_ingredient.dart';

class Recipe {
  final int id;
  final String category;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;

  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      image: json['image'],
      chef: json['chef'],
      time: json['time'],
      rating: json['rating'].toDouble(),
      ingredients: (json['ingredients'] as List)
          .map((ingredientJson) => RecipeIngredient.fromJson(ingredientJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'image': image,
      'chef': chef,
      'time': time,
      'rating': rating,
      'ingredients':
          ingredients.map((ingredient) => ingredient.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, category: $category, chef: $chef, time: $time, rating: $rating, ingredients: ${ingredients.length})';
  }
}

class RecipeList {
  final List<Recipe> recipes;

  RecipeList({required this.recipes});

  factory RecipeList.fromJson(Map<String, dynamic> json) {
    return RecipeList(
      recipes: (json['recipes'] as List)
          .map((recipeJson) => Recipe.fromJson(recipeJson))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'RecipeList(recipes: ${recipes.length})';
  }
}
