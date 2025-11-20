import 'package:flutter/material.dart';
import 'package:meal_recipe_app/data/category_data.dart';
import 'package:meal_recipe_app/screen/meals_screen.dart';

class CategoryScreen extends StatelessWidget {
  // final CategoryModel categories; required this.categories
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // har row kitne item
          crossAxisSpacing: 20, // columns ke beech ka gap (horizontal)
          mainAxisSpacing: 20, // rows ke beech ka gap (vertical)
        ),
        children: List.generate(categories.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Mealscreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              // color: categories[index].color,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    categories[index].color.withValues(alpha: 0.55),
                    categories[index].color.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                categories[index].title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
