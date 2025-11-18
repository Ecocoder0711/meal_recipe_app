import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Category")),
      body: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // har row kitne item
          crossAxisSpacing: 20, // columns ke beech ka gap (horizontal)
          mainAxisSpacing: 20, // rows ke beech ka gap (vertical)
        ),
        children: [
          for (int i = 1; i < 20; i++)
            Container(color: Colors.amber, child: Text("cell number $i")),
        ],
      ),
    );
  }
}
