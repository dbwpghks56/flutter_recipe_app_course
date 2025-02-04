import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/splash_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            child: Column(
              children: [
                const SizedBox(height: 104),
                Image.asset(
                  'assets/image/crown.png',
                  width: 79,
                  height: 79,
                ),
                const SizedBox(height: 14),
                Text(
                  "100K+ Premium Recipe",
                  style: TextStyles.mediumTextBold.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
                const Spacer(),
                Text(
                  "Get",
                  style: TextStyles.headerTextBold.copyWith(
                    fontSize: 50,
                    color: ColorStyles.white,
                  ),
                ),
                Text(
                  "Cooking",
                  style: TextStyles.headerTextBold.copyWith(
                    fontSize: 50,
                    color: ColorStyles.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Simple way to find Tasty Recipe",
                  style: TextStyles.normalTextRegular.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
                const SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: MediumButton(
                    "Start Cooking",
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 84),
              ],
            ),
          )
        ],
      ),
    );
  }
}
