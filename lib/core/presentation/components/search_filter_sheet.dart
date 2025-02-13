import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/filter_buttons.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/small_button.dart';
import 'package:flutter_recipe_app_course/domain/filter/filter_state.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class SearchFilterSheet extends StatefulWidget {
  final FilterState state;
  final void Function(FilterState state) onTapFilter;
  const SearchFilterSheet({
    super.key,
    required this.onTapFilter,
    required this.state,
  });

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  late FilterState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 31,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Filter Search",
              style: TextStyles.smallerTextBold,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Time",
            style: TextStyles.smallerTextBold,
          ),
          const SizedBox(
            height: 10,
          ),
          FilterButtons(
            items: const ["All", "Newest", "Oldest", "Popularity"],
            selectedItem: _state.time,
            onSelected: (item) {
              setState(() {
                _state = _state.copyWith(time: item);
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Rate",
            style: TextStyles.smallerTextBold,
          ),
          const SizedBox(
            height: 10,
          ),
          FilterButtons(
            items: const ["5", "4", "3", "2", "1"],
            selectedItem: _state.rate.toString(),
            onSelected: (item) {
              setState(() {
                _state = _state.copyWith(rate: int.parse(item));
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Category",
            style: TextStyles.smallerTextBold,
          ),
          const SizedBox(
            height: 10,
          ),
          FilterButtons(
            items: const [
              "All",
              "Cereal",
              "Vegetables",
              "Dinner",
              "Chinese",
              "Local Dish",
              "Fruit",
              "BreakFast",
              "Spanish",
              "Japanese",
              "Lunch",
            ],
            selectedItem: _state.category,
            onSelected: (item) {
              setState(() {
                _state = _state.copyWith(category: item);
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              width: 174,
              child: SmallButton(
                "Filter",
                onPressed: () {
                  widget.onTapFilter(_state);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }
}
