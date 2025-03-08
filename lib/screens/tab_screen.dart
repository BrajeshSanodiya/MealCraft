

import 'package:flutter/material.dart';
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

void _selectPage(int index){
setState(() {
  _selectedPageIndex=index;
});
}

@override
  Widget build(BuildContext context) {
    Widget activePage= const CategoriesScreen();
    String activePageTitle= 'Categories';
      if(_selectedPageIndex ==1){
        activePage=MealsScreen(meals: []);
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