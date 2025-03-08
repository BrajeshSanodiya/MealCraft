import 'package:flutter/material.dart';
import 'package:meal_craft/screens/tab_screen.dart';
// import 'package:meal_craft/main_drawer.dart';
// import 'package:meal_craft/screens/tab_screen.dart';



class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;
  @override
  State<StatefulWidget> createState() {
    return _FliterScreenState();
  }
}

class _FliterScreenState extends State<FilterScreen> {

  var _glutenFreeFilterSet = false;
  var _lactoesFreeFilterSet = false;
  var _vegiterianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet=widget.currentFilters[Filter.glutenFree]!;
    _lactoesFreeFilterSet=widget.currentFilters[Filter.lactoseFree]!;
    _vegiterianFreeFilterSet=widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFilterSet=widget.currentFilters[Filter.vegan]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),

      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meal'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctr)=>TabScreen()));
      //   }
      // }),
      // PopScope(
      //   canPop: false,
      //   onPopInvokedWithResult: (bool didPop, dynamic result) {
      //     if(didPop) return;
      //       Navigator.of(context).pop({
      //         Filter.glutenFree: _glutenFreeFilterSet,
      //         Filter.lactoseFree: _lactoseFreeFilterSet,
      //         Filter.vegetarian: _vegetarianFilterSet,
      //         Filter.vegan: _veganFilterSet,
      //       });
      //     },
      //     child: Column(...) // same code as shown in the next lecture
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) async {
          if(didPop)return;
           Navigator.of(context).pop({
                Filter.glutenFree: _glutenFreeFilterSet,
                Filter.lactoseFree: _lactoesFreeFilterSet,
                Filter.vegetarian: _vegiterianFreeFilterSet,
                Filter.vegan: _veganFreeFilterSet,
              });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Oly include gluten-free meals.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoesFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoesFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Oly include lactose-free meals.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegiterianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegiterianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Oly include vegetarian meals.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Oly include vegan meals.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
