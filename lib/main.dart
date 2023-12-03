import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:third_app/Models/meal.dart';
import 'package:third_app/Screens/filters_screen.dart';
import 'package:third_app/Screens/meal_detail_screen.dart';
import 'package:third_app/Screens/tabs_screen.dart';
import 'package:third_app/dummy_categories.dart';

import 'Screens/category_meal_screen.dart';
import 'Screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _userFavoritesMeals = [];

  void _saveFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });
    _availableMeals = DUMMY_MEALS.where((item) {
      if (_filters['gluten'] as bool && !item.isGlutenFree) return false;
      if (_filters['lactose'] as bool && !item.isLactoseFree) return false;
      if (_filters['vegan'] as bool && !item.isVegan) return false;
      if (_filters['vegetarian'] as bool && !item.isVegetarian) return false;
      return true;
    }).toList();
  }

  void _toggleMeal(String mealId) {
    final existingMeal = _userFavoritesMeals.indexWhere((item) => item.id == mealId);
     if (existingMeal >= 0) {
       setState(() {
          _userFavoritesMeals.removeAt(existingMeal);
       });
      }
      else{
        setState(() {
          _userFavoritesMeals
            .add(DUMMY_MEALS.firstWhere((item) => item.id == mealId));
        });
      }
    
  }

  bool _isFavoriteMeal(String mealId) {
    return _userFavoritesMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.amber, primary: Colors.pink),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleSmall: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
                titleMedium: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
                titleLarge: TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              ),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.white)),
      routes: {
        '/': (ctx) => TabsScreen(userFavoritesMeals: _userFavoritesMeals,),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              toggelMeal: _toggleMeal,isFavoriteMeal: _isFavoriteMeal,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              saveFilter: _saveFilter,
              selectedFilters: _filters,
            )
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
