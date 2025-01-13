import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class BigButton extends StatefulWidget {
  const BigButton(
    this.text, {
    super.key,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = !isPressed;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = !isPressed;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : ColorStyles.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              child: Text(
                widget.text,
                style: TextStyles.normalTextBold.copyWith(
                  color: ColorStyles.white,
                ),
              ),
            ),
            const SizedBox(width: 11),
            Icon(
              Icons.arrow_forward,
              size: 20,
              color: ColorStyles.white,
            ),
          ],
        ),
      ),
    );
  }
}
