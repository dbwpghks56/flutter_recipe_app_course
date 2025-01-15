import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/small_button.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({
    super.key,
    required this.title,
    required this.score,
    required this.actionName,
    required this.onChange,
  });

  final String title;
  final int score;
  final String actionName;
  final void Function(int) onChange;

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          widget.title,
          style: TextStyles.smallerTextRegular,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: _RatingBar(
        value: _value,
        onChange: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
      actions: [
        SmallButton(
          widget.actionName,
          onPressed: () {
            widget.onChange(_value);
          },
          color: ColorStyles.rating,
          textStyle: TextStyles.smallerTextRegular,
        ),
      ],
    );
  }
}

class _RatingBar extends StatelessWidget {
  const _RatingBar({
    super.key,
    required this.value,
    required this.onChange,
  });

  final int value;
  final void Function(int value) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) {
          return GestureDetector(
            onTapDown: (_) {
              onChange(index + 1);
            },
            child: Icon(
              value - 1 >= index ? Icons.star : Icons.star_border_outlined,
              size: 30,
              color: ColorStyles.rating,
            ),
          );
        },
      ),
    );
  }
}
