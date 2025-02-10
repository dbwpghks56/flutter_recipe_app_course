import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    required this.placeHolder,
    this.controller,
    this.isReadOnly = false,
  });
  final String placeHolder;
  final bool isReadOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: ColorStyles.gray4,
          ),
          hintText: placeHolder,
          hintStyle: TextStyles.smallerTextRegular.copyWith(
            color: ColorStyles.gray4,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorStyles.gray4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorStyles.primary80,
            ),
          ),
        ),
      ),
    );
  }
}
