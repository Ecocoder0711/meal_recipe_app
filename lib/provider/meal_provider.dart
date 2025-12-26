import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/data/meal_data.dart';

final mealProvider = Provider((ref) {
  return meals;
});
