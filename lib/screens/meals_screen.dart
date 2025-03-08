import 'package:flutter/material.dart';
import 'package:meal_craft/models/meal.dart';
import 'package:meal_craft/screens/meal_details_screen.dart';
import 'package:meal_craft/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
   final void Function(Meal meal) onToggleFavorite;

  
  _openMealDetailScreen(BuildContext ctx, int mealIndex) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meals[mealIndex],onToggleFavorite: onToggleFavorite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Uh oh ... nothing here",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Try selecting a differnt category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder:
            (context, index) => MealItem(
              meal: meals[index],
              onMealSelected:() {
                _openMealDetailScreen(context, index);
              },
            ),
      );
    }
    if(title==null) {
      return content;
    } else{
      return Scaffold(
        appBar: AppBar(
            title: Text(title!),
          ), 
        body: content);
    }
  }
}
