import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/small_button.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
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
          BigButton(
            "Big Button",
            onPressed: () {
              print("Big Button Pressed");
            },
          ),
          MediumButton(
            "Medium Button",
            onPressed: () {
              print("Medium Button Pressed");
            },
          ),
          SmallButton(
            "Small Button",
            onPressed: () {
              print("Small Button Pressed");
            },
          ),
        ],
      ),
    );
  }
}
