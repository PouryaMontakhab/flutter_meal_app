import 'package:flutter/material.dart';

import '../Screens/category_meal_screen.dart';

class Category_Item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const Category_Item(
      {required this.id, required this.title, required this.color});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName,arguments: {'id': id, 'title':title});
  }

  @override 
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
