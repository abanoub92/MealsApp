import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext context){
    //navigate to route screen
    // Navigator.of(context).push(MaterialPageRoute(builder: (_){
    //   return CategoryMealsScreen(title);
    // }));

    //navigate to route screen by name of screen route in main routes property
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.SCREEN_ROUTE, 
      arguments: {
        'id': id,
        'title': title
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Text(title, style: Theme.of(context).textTheme.headline,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}