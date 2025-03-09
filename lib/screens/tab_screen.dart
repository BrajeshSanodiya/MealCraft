import 'package:flutter/material.dart';
import 'package:meal_craft/providers/favourite_provider.dart';
import 'package:meal_craft/screens/main_drawer.dart';
import 'package:meal_craft/screens/categories_screen.dart';
import 'package:meal_craft/screens/filter_screen.dart';
import 'package:meal_craft/screens/meals_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_craft/providers/filters_provider.dart';


const defaultFilter = {Filter.glutenFree:false,
Filter.lactoseFree:false,
Filter.vegetarian:false,
Filter.vegan:false};
class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _seletedDrawerScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    }else{
      _selectPage(0);
    }
  }

 
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals =ref.watch(filteredMealProvider);
    final favoritesMeals =ref.watch(favoriteProvider);

    Widget activePage = CategoriesScreen(
      meals: availableMeals
    );
    String activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoritesMeals,
      );
      activePageTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _seletedDrawerScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
