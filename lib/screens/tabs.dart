

import 'package:flutter/material.dart';
import 'package:meals/providers/favourite_provider.dart';
import 'package:meals/screens/categoryies.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegiterian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  // final List<Meal> _favouriteMeals = []; //add favourite meals and go to screen
  int _selectedPageIndex = 0;
  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  // void _showInfoMassage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  // void _toggoleMealFavouriteStatus(Meal meal) {
  //   final isExisting = _favouriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favouriteMeals
  //           .remove(meal); //this state is used to instant update the state
  //     });
  //     _showInfoMassage('Meal is no longer a favourite..');
  //   } else {
  //     setState(() {
  //       _favouriteMeals
  //           .add(meal); //this state is used to instant update the state
  //       _showInfoMassage('Marked as favourite');
  //     });
  //   }
  // } this is comment becoz we use provider

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifire) async {
    Navigator.of(context).pop();
    if (identifire == 'filters') {
      // final result = await Navigator.of(context).push<Map<Filter, bool>>
       await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
            // currentFilter: _selectedFilters,
          ),
        ),
      );

      // setState(() {
      //   // _selectedFilters = result ?? kInitialFilters;
      // });
    }
    // else{
    //   Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
  //   final meals = ref.watch(mealsProvider);
  //  final activeFiler = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    // meals.where((meal) {
    //   if ( activeFiler[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }

    //   if ( activeFiler[Filter.lactosFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }

    //   if ( activeFiler[Filter.vegiterian]! && !meal.isVegetarian) {
    //     return false;
    //   }

    //   if ( activeFiler[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }

    //   return true;
    // }).toList();

    Widget activePage = CategoryiesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activePageTitle = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ), // it is used to side option bar

      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ), //this tab are used for user are go to the category screen
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite'),
        ],
      ),
    );
  }
}
