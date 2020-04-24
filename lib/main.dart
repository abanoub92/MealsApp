import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          subhead: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          headline: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.bold,),
        ),
      ),
      //1- we can dispinsing of (home:) property by adding home route 
      //to routes property
      //home: CategoriesScreen(),
      routes: {
        //2- such as next line    
        //(/) this by default refer to home screen
        '/': (context) => CategoriesScreen(),
        CategoryMealsScreen.SCREEN_ROUTE : (context) => CategoryMealsScreen(),
      },

      //if you want to change the home route key (/) 
      //to anything of your imagine, use initialRoute property
      //such as next line
      //initialRoute: '/home',
    );
  }
}
