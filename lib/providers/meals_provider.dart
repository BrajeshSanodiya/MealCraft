import 'package:meal_craft/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref){
  return dummyMeals;
});