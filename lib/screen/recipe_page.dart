import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/model/meals_model.dart';
import 'package:meal_recipe_app/provider/favorites_provider.dart';
import 'package:meal_recipe_app/widget/snackbar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
            // Each ingredient types out on its own line, one after another
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: meal.ingredients.asMap().entries.map((entry) {
                  int index = entry.key;
                  String item = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AnimatedTextKit(
                      key: ValueKey(index),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "• $item",
                          textStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: Duration(
                        milliseconds: index * 800,
                      ), // Delay based on index
                      displayFullTextOnTap: true,
                      isRepeatingAnimation: false,
                    ),
                  );
                }).toList(),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: meal.steps.asMap().entries.map((entry) {
                  int stepindex = entry.key;
                  String stepitem = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: AnimatedTextKit(
                      key: ValueKey(stepindex),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "• $stepitem",
                          textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: Duration(
                        milliseconds: stepindex * 800,
                      ), // Delay based on index
                      displayFullTextOnTap: true,
                      isRepeatingAnimation: false,
                    ),
                  );
                }).toList(),
              ),
            ),

            // ...meal.steps.map((step) {
            //   return Padding(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 10,
            //       vertical: 6.0,
            //     ),
            //     child: Text(
            //       step,
            //       style: TextStyle(color: Colors.white70),
            //       textAlign: TextAlign.center,
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
