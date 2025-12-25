import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:meal_recipe_app/runapp.dart';

void main() {
  runApp(const ProviderScope(child: MealRecipeApp()));
}
