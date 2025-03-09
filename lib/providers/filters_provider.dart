import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_craft/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
   void setFilterS(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
      return FiltersNotifier();
    });


final filteredMealProvider = Provider((ref){
    final meals=ref.watch(mealsProvider);
    final activeFilters= ref.watch(filterProvider);
    
    return meals.where((meal){
        if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
          return false;
        }
        if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
          return false;
        }
        if(activeFilters[Filter.vegetarian]! && !meal.isVegetarian){
          return false;
        }
        if(activeFilters[Filter.vegan]! && !meal.isVegan){
          return false;
        }
        return true;
    }).toList();
 

});