import 'package:flutter/material.dart';
import 'package:meal_craft/data/dummy_data.dart';
import 'package:meal_craft/models/category.dart';
import 'package:meal_craft/models/meal.dart';
import 'package:meal_craft/screens/meals_screen.dart';
import 'package:meal_craft/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.meals});

  final List<Meal> meals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext ctx, Category category) {
    final filteredMeal =
        widget.meals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    print('avialable meals ${widget.meals.length}');
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeal,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController, 
      builder: (context, child) => SlideTransition(position: _animationController.drive(
        Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ),
      ), child: child,),
      child: GridView(
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
    ),
      );
  }
}
