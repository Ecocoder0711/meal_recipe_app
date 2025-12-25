import 'package:flutter/material.dart';
import 'package:meal_recipe_app/screen/category_screen.dart';
import 'package:meal_recipe_app/screen/favorites_screen.dart';
import 'package:meal_recipe_app/utils/theme_data.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Widget> _screen = [CategoryScreen(), FavoritesScreen()];
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedindex) {
          setState(() {
            _selectedindex = selectedindex;
          });
        },
        backgroundColor: Mytheme.colorscheme(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        currentIndex: _selectedindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
