import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../screens/meal_details_screen.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  void selectedMeal(BuildContext context, Meal meal){
    Navigator.of(context).pushNamed(
      MealDetailsScreen.SCREEN_ROUTE,
      arguments: meal,
    ).then((result){
      print('backward value is $result');
    });
  }

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty ? 
      Center(
        child: Text('You have no favorites yet\nstart adding some...'),
      )
      :
      ListView.builder(itemBuilder: (context, index){
          return MealItem(
            meal: favoriteMeals.elementAt(index),
            onClick: () => selectedMeal(context, favoriteMeals.elementAt(index)),
          );
        }, itemCount: favoriteMeals.length,);
  }
}