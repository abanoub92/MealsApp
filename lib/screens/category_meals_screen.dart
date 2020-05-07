import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
//import '../dummy_data.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {

  //prevent to spelling mistakes create constant
  //variable with the name of screen route
  static const SCREEN_ROUTE = '/category_meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  // final String title;

  // CategoryMealsScreen(this.title);

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
    
    final routesArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routesArg['id'];
    final categoryTitle = routesArg['title'];

    final categoryMeals = availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    });

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (context, index){
        return MealItem(
          meal: categoryMeals.elementAt(index),
          onClick: () => selectedMeal(context, categoryMeals.elementAt(index)),
        );
      }, itemCount: categoryMeals.length,),
    );
  }
}