import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/filter_button.dart';

class FilterButtons extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final void Function(String itme) onSelected;

  const FilterButtons({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.expand(
        (element) {
          return [
            GestureDetector(
              onTap: () {
                onSelected(element);
              },
              child: FilterButton(
                element,
                isSelected: element == selectedItem,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ];
        },
      ).toList(),
    );
  }
}
