import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
    this.text, {
    super.key,
    this.isSelected = false,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor:
          isSelected ? ColorStyles.primaryColor : ColorStyles.white,
      side: BorderSide(
        color: ColorStyles.primaryColor,
      ),
      label: Text(
        text,
        style: TextStyles.smallerTextRegular.copyWith(
          color: isSelected ? ColorStyles.white : ColorStyles.primary80,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
