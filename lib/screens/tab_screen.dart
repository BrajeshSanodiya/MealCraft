

import 'package:flutter/material.dart';
import 'package:meal_craft/models/meal.dart';
import 'package:meal_craft/screens/categories_screen.dart';
import 'package:meal_craft/screens/meals_screen.dart';

class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen>{
int _selectedPageIndex=0;
final List<Meal> _favoriteMeal=[];

void _showInfoMessage(String message){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      ));
}

void _toggleMealFavoriteStatus(Meal meal){
  final isExisting = _favoriteMeal.contains(meal);
  if(isExisting)
  {
    setState(() {
      _favoriteMeal.remove(meal);
    });
    _showInfoMessage('Meal is no loger a favorite.');
  }else{
    setState(() {
       _favoriteMeal.add(meal);
    });
      _showInfoMessage('Marked as a favorite.');
  }
}

void _selectPage(int index){
setState(() {
  _selectedPageIndex=index;
});
}

@override
  Widget build(BuildContext context) {
    Widget activePage= CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus, );
    String activePageTitle= 'Categories';
      if(_selectedPageIndex ==1){
        activePage=MealsScreen(meals: _favoriteMeal, onToggleFavorite: _toggleMealFavoriteStatus);
        activePageTitle = 'Favourites';
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label:  'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites")
        ]
        ),

    );
  }

}