import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_craft/models/meal.dart';

class FavouriteNotifier extends StateNotifier<List<Meal>> {
  FavouriteNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteProvider = StateNotifierProvider<FavouriteNotifier, List<Meal>>((
  ref,
) {
  return FavouriteNotifier();
});
