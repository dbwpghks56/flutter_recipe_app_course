import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 315 / 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(recipe.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 315 / 150,
            child: Container(
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
            right: 10,
            bottom: 10,
            child: Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: ColorStyles.white,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
                const SizedBox(width: 10),
                ClipOval(
                  child: Container(
                    color: ColorStyles.white,
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.bookmark_border_outlined,
                      color: ColorStyles.primary80,
                      size: 17,
                    ),
                  ),
                )
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
      ),
    );
  }
}
