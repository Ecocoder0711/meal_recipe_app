import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/model/meals_model.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Mealmodel>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavState(Mealmodel meal) {
    bool mealIsFav = state.contains(meal);
    if (mealIsFav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Mealmodel>>((ref) {
      return FavoritesMealsNotifier();
    });
