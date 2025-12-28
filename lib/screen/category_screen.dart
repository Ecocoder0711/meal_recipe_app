import 'package:flutter/material.dart';
import 'package:meal_recipe_app/data/category_data.dart';
import 'package:meal_recipe_app/screen/meals_screen.dart';

class CategoryScreen extends StatefulWidget {
  // final CategoryModel categories; required this.categories
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
          final Animation<double> animation =
              Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (1 / categories.length) * index,
                    1.0,
                    curve: Curves.easeOutQuint,
                  ),
                ),
              );
          return AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: animation,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    100 * (1 - animation.value),
                  ), // Slide up effect
                  child: child,
                ),
              );
            },
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Mealscreen(
                      title: categories[index].title,
                      catid: categories[index].id,
                    ),
                  ),
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
            ),
          );
        }),
      ),
    );
  }
}
