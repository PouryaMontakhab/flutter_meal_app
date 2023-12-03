import 'package:flutter/material.dart';
import 'package:third_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilter;
  static const routeName = 'filters';
  Map<String, bool> selectedFilters;
  FiltersScreen({required this.saveFilter, required this.selectedFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.selectedFilters['gluten'] ?? false;
    _vegetarian = widget.selectedFilters['vegetarian'] ?? false;
    _vegan = widget.selectedFilters['vegan'] ?? false;
    _lactoseFree = widget.selectedFilters['lactose'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subTitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        value: currentValue,
        onChanged: (newValue) => updateValue(newValue),
        inactiveThumbColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
        subtitle: Text(subTitle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.saveFilter({
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  });
                },
                icon: Icon(Icons.save))
          ],
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
