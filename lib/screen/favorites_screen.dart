import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/model/meals_model.dart';
import 'package:meal_recipe_app/provider/favorites_provider.dart';
import 'package:meal_recipe_app/screen/recipe_page.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Mealmodel> favoriteMeals = ref.watch(favoriteMealsProvider);
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favorites",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Icon(Icons.favorite_border, size: 100, color: Colors.redAccent),
              const SizedBox(height: 16),
              Text(
                "No Favorite yet!",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Start adding some meals to your list.",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          final meal = favoriteMeals[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            color: Colors.grey[900],
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipePage(meal: meal),
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, error, stackTrace) => Container(
                        color: Colors.grey[800],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                size: 16,
                                color: Colors.white54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${meal.duration} min',
                                style: const TextStyle(color: Colors.white54),
                              ),
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.work_outline,
                                size: 16,
                                color: Colors.white54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                meal.complexity.name,
                                style: const TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(Icons.favorite, color: Colors.redAccent),
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
