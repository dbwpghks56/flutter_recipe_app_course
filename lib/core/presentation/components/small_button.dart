import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  const SmallButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.color = ColorStyles.primaryColor,
    this.textStyle = TextStyles.normalTextBold,
  });

  final String text;
  final Color color;
  final TextStyle textStyle;
  final void Function() onPressed;

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
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
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : widget.color,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: widget.textStyle.copyWith(
              color: ColorStyles.white,
            ),
          ),
        ),
      ),
    );
  }
}
