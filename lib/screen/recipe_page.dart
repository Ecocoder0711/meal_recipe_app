import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/model/meals_model.dart';
import 'package:meal_recipe_app/provider/favorites_provider.dart';
import 'package:meal_recipe_app/widget/snackbar.dart';

class RecipePage extends ConsumerWidget {
  final Mealmodel meal;
  const RecipePage({super.key, required this.meal});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Mealmodel> favouriteMeals = ref.watch(favoriteMealsProvider);
    final isFav = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: '${meal.id}_text',
          child: Material(
            color: Colors.transparent,
            child: Text(
              meal.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          // Favorite icon button
          IconButton(
            onPressed: () {
              bool wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavState(meal);
              showFavoriteSnackbar(context, wasAdded);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                isFav ? Icons.favorite_rounded : Icons.favorite_border,
                key: ValueKey(isFav),
                color: isFav ? Colors.redAccent : Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              "Ingredients",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            // ... means we are using spread opearators
            ...meal.ingredients.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Text(item, style: TextStyle(color: Colors.white70)),
              );
            }),
            const SizedBox(height: 10),
            const Text(
              "Steps",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            ...meal.steps.map((step) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6.0,
                ),
                child: Text(
                  step,
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
