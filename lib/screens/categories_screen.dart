import 'package:flutter/material.dart';
import 'package:meal_craft/data/dummy_data.dart';
import 'package:meal_craft/models/category.dart';
import 'package:meal_craft/models/meal.dart';
import 'package:meal_craft/screens/meals_screen.dart';
import 'package:meal_craft/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext ctx, Category category) {
    final filteredMeal =
        availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    print('avialable meals ${availableMeals.length}');
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeal,
              onToggleFavorite: onToggleFavorite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
