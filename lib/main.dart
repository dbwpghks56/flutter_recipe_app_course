import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/filter_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/rating_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/small_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/two_tab.dart';
import 'package:flutter_recipe_app_course/core/presentation/dialogs/rating_dialog.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

import 'core/routing/router.dart';

void main() {
  diSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: ColorStyles.primary100,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Components',
          style: TextStyles.largeTextBold,
        ),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return RatingDialog(
                      title: "Rating recipe",
                      score: 3,
                      actionName: "Send",
                      onChange: (value) {
                        print("Rating: $value");
                      },
                    );
                  });
            },
            child: Text("Rating Dialog Test"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TwoTab(
              labels: [
                "Tab 1",
                "Tab 2",
              ],
              selectedIndex: 0,
              onChange: (index) {
                print("Tab $index Pressed");
              },
            ),
          ),
          FilterButton(
            "Filter Button",
          ),
          FilterButton(
            "Filter Button",
            isSelected: true,
          ),
          RatingButton(
            "5",
          ),
          RatingButton(
            "5",
            isSelected: true,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton(
              "Big Button",
              onPressed: () {
                print("Big Button Pressed");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumButton(
              "Medium Button",
              onPressed: () {
                print("Medium Button Pressed");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallButton(
              "Small Button",
              onPressed: () {
                print("Small Button Pressed");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
              label: "Label",
              placeHolder: "Place Holder",
            ),
          ),
        ],
      ),
    );
  }
}
