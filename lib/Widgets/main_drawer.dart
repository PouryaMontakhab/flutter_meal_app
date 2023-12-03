import 'package:flutter/material.dart';
import 'package:third_app/Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text('Cooking up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary)),
        ),
        SizedBox(height: 10),
        buildListTile(Icons.restaurant, 'Meals', () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        SizedBox(
          height: 10,
        ),
        buildListTile(Icons.filter, 'Filter', () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        })
      ]),
    );
  }
}
