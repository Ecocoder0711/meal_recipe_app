import 'package:flutter/material.dart';

void showFavoriteSnackbar(BuildContext context, bool isFav) {
  ScaffoldMessenger.of(context).clearSnackBars(); // Clear existing ones
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        isFav ? "Added to Favorite list" : "Removed from favorite list",
        style: const TextStyle(color: Colors.white),
      ),
      elevation: 3,
      backgroundColor: isFav ? Colors.green : Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 2),
    ),
  );
}
