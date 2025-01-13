import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    this.controller,
  });

  final String label;
  final String placeHolder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.smallerTextRegular,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
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
      ],
    );
  }
}
