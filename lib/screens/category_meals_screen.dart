import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {

  //prevent to spelling mistakes create constant
  //variable with the name of screen route
  static const SCREEN_ROUTE = '/category_meals';

  // final String title;

  // CategoryMealsScreen(this.title);

  @override
  Widget build(BuildContext context) {
    
    final routesArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routesArg['id'];
    final categoryTitle = routesArg['title'];

    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    });

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (context, index){
        return Text(categoryMeals.elementAt(index).title);
      }, itemCount: categoryMeals.length,),
    );
  }
}