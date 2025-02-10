import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/search_input_field.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello $name",
                      style: TextStyles.largeTextBold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "What are you cooking today?",
                      style: TextStyles.smallerTextRegular,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary40,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/image/profile.png",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: SearchInputField(
                    placeHolder: "Search recipe",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorStyles.primary100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.tune,
                    color: ColorStyles.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
