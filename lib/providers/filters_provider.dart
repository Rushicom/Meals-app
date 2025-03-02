import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meal_provider.dart';


enum Filter {
  glutenFree,
  lactosFree,
  vegiterian,
  vegan
}

class FiltersNotifire extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifire() : super({
    Filter.glutenFree : false,
    Filter.lactosFree : false,
    Filter.vegiterian : false,
    Filter.vegan : false,
  });

  void setFilters(Map<Filter, bool> chosenFilers){
      state = chosenFilers;
  }

  void setFilter(Filter filter, bool isActive){
    // state[filter] = isActive; // not allowed != mutating state

    state = {
      ...state,
      filter : isActive

    };
  }

}

final filtersProvider = StateNotifierProvider<FiltersNotifire, Map<Filter,bool>>((ref){
  return FiltersNotifire();
});



final filteredMealsProvider = Provider((ref){
 final meals =  ref.watch(mealsProvider);
 final activeFilter = ref.watch(filtersProvider);
 return meals.where((meal) {
      if ( activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if ( activeFilter[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }

      if ( activeFilter[Filter.vegiterian]! && !meal.isVegetarian) {
        return false;
      }

      if ( activeFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();
});