import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> userFavoritesMeals;

  const FavoritesScreen({required this.userFavoritesMeals});

  @override
  Widget build(BuildContext context) {
    if (userFavoritesMeals.isEmpty) {
      return Center(
        child: Text('your favorites items'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: userFavoritesMeals[index].id,
            title: userFavoritesMeals[index].title,
            imageUrl: userFavoritesMeals[index].imageUrl,
            duration: userFavoritesMeals[index].duration,
            complexity: userFavoritesMeals[index].complexity,
            affordability: userFavoritesMeals[index].affordability,
          );
        },
        itemCount: userFavoritesMeals.length,
      );
    }
  }
}
