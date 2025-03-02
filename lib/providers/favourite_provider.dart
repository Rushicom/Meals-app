import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
 
 class FavouriteMealsNotifire extends StateNotifier<List<Meal>>{
    FavouriteMealsNotifire() : super([]);

    bool toggoleMealFavouriteStatus(Meal meal){
     final mealIsFavourite =  state.contains(meal);
     if(mealIsFavourite){
      state = state.where((m)=>m.id != meal.id).toList();
      return false;
     }else{
        state = [...state, meal];//it is a spread operator 
        return true;
     }
      
    }
 }

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifire, List<Meal>>((ref){
  return FavouriteMealsNotifire();
}); //that is optimized for data can be changed it is used for changable state provider where only provider can not change state it is greate for satitc dummy data

