import 'package:flutter/material.dart';
import 'package:meal_recipe_app/data/meal_data.dart';
import 'package:meal_recipe_app/screen/recipe_page.dart';
import 'package:meal_recipe_app/widget/item_trait.dart';

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
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipePage(meal: meal)),
            ),
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              child: Stack(
                children: [
                  Image.network(meal.imageUrl, fit: BoxFit.cover),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 40,
                      ),
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Text(
                            meal.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ItemTrait(
                                text: '${meal.duration}',
                                icon: Icons.timelapse_outlined,
                              ),
                              ItemTrait(
                                text: meal.complexity.name,
                                icon: Icons.article_outlined,
                              ),
                              ItemTrait(
                                text: meal.affordability.name,
                                icon: Icons.currency_rupee,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
