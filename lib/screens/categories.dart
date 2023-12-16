import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';
import '../models/meal.dart';
import 'meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavourite});
  final void Function(Meal meal) onToggleFavourite;
  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MealsScreen(title: category.title, meals: filteredMeals, onToggleFavourite: onToggleFavourite,)));//Navigator.push(context, route)

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children:  [
          for (final category in availableCategories)
            CategoryGridItem(category: category,onSelectCategory: (){_selectCategory(context, category);},)
        ],
      ),
    );
  }
}
