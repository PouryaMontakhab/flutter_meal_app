import 'package:flutter/material.dart';
import 'package:third_app/Models/meal.dart';
import 'package:third_app/Screens/category_screen.dart';
import 'package:third_app/Screens/favorites_screen.dart';
import 'package:third_app/Widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> userFavoritesMeals;
  const TabsScreen({required this.userFavoritesMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages=[];
  int selectedTabIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(
          userFavoritesMeals: widget.userFavoritesMeals,
        ),
        'title': 'Favorites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[selectedTabIndex]['title'] as String),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        drawer: MainDrawer(),
        body: _pages[selectedTabIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ));
  }
}
