import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class RecipeGridItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeGridItem({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(recipe.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorStyles.black.withValues(alpha: 0.7),
                ColorStyles.black.withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  recipe.name,
                  style: TextStyles.smallerTextBold.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
              ),
              Text(
                "By ${recipe.chef}",
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.gray4,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 37,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorStyles.secondary20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorStyles.rating,
                  size: 12,
                ),
                Text(
                  recipe.rating.toString(),
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
