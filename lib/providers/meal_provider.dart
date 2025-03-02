import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/dumy_data.dart';
final mealsProvider = Provider( (ref){ //provider can not change state it is greate for satitc dummy data
  return dummyMeals;
} );