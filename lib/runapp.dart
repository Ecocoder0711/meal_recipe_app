import 'package:flutter/material.dart';
import 'package:meal_recipe_app/screen/category_screen.dart';
import 'package:meal_recipe_app/utils/theme_data.dart';

class MealRecipeApp extends StatelessWidget {
  const MealRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal Recipe App",
      home: CategoryScreen(),
      theme: Mytheme.colorscheme(context),
    );
  }
}
// categories: categorymodel[categorymodel.length]