import 'package:flutter/material.dart';
import 'package:meal_recipe_app/data/meal_data.dart';

class Mealscreen extends StatelessWidget {
  final String title;
  final String catid; //categories Id
  const Mealscreen({super.key, required this.title, required this.catid});

  @override
  Widget build(BuildContext context) {
    // Filter meals that belong to this category
    final filteredMeals = meals.where((meals) {
      return meals.categories.contains(catid);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (context, index) {
          final meal = filteredMeals[index];
          return Container(child: Image.network(meal.imageUrl));
        },
      ),
    );
  }
}
