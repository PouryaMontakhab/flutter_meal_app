import 'package:flutter/material.dart';
import 'package:third_app/dummy_categories.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggelMeal;
  final Function isFavoriteMeal;
  static const routeName = 'meal_detail';

  const MealDetailScreen({required this.toggelMeal, required this.isFavoriteMeal});

  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(20),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((item) => item.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 250,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ))),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                            color: const Color.fromARGB(255, 47, 45, 45)),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Text('Steps', style: Theme.of(context).textTheme.titleLarge),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  title: Text(selectedMeal.steps[index]),
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavoriteMeal(mealId) ? Icons.star : Icons.star_border),
        backgroundColor: Theme.of(context).colorScheme.error,
        onPressed: () => toggelMeal(mealId),
      ),
    );
  }
}
