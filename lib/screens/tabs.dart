import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  void showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters'){
      final result = await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(builder: (ctx)=>FiltersScreen()));
      print(result);
    }
  }
  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);
    if (isExisting){
      setState(() {
        _favouriteMeals.remove(meal);
      });
      showInfoMessage('Meal is no longer a favourite');

    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      showInfoMessage('Meal added as a favourite!');

    }
}

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  var activePageTitle = 'Categories';

  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus,);
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: _favouriteMeals, onToggleFavourite: _toggleMealFavouriteStatus,);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: MaintainDrawer(onSelectScreen: (String identifier) { _setScreen(identifier); },),
        body: activePage,
        bottomNavigationBar:
            BottomNavigationBar(currentIndex: _selectedPageIndex,onTap: _selectPage, items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),

        ]));
  }
}
