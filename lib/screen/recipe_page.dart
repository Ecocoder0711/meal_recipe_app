import 'package:flutter/material.dart';
import 'package:meal_recipe_app/model/meals_model.dart';

class RecipePage extends StatelessWidget {
  final Mealmodel meal;
  const RecipePage({required this.meal, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Center(child: Text("This the RecipePage")),
    );
  }
}
