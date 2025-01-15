import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class TwoTab extends StatelessWidget {
  const TwoTab({
    super.key,
    required this.labels,
    this.selectedIndex = 0,
    required this.onChange,
  });

  final List<String> labels;
  final int selectedIndex;
  final void Function(int index) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: selectedIndex == 0
                ? _SelectedTab(text: labels[0])
                : _UnSelectedTab(text: labels[0]),
            onTap: () {
              onChange(0);
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            child: selectedIndex == 1
                ? _SelectedTab(text: labels[1])
                : _UnSelectedTab(text: labels[1]),
            onTap: () {
              onChange(1);
            },
          ),
        ),
      ],
    );
  }
}

class _SelectedTab extends StatelessWidget {
  const _SelectedTab({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyles.smallTextBold.copyWith(
            color: ColorStyles.white,
          ),
        ),
      ),
    );
  }
}

class _UnSelectedTab extends StatelessWidget {
  const _UnSelectedTab({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.white,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyles.smallTextBold.copyWith(
            color: ColorStyles.primary80,
          ),
        ),
      ),
    );
  }
}