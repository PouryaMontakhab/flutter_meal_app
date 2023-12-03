import 'package:flutter/material.dart';
import 'package:third_app/Widgets/category_item.dart';
import 'package:third_app/dummy_categories.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((catData) => Category_Item(
              id: catData.id, title: catData.title, color: catData.color))
          .toList(),
    );
  }
}
