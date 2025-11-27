import 'package:flutter/material.dart';

class ItemTrait extends StatelessWidget {
  final IconData icon;
  final String text;
  const ItemTrait({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
