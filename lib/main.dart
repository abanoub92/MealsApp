import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/bottom_navigation_bar_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';

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
          subhead: TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontWeight: FontWeight.bold),
          headline: TextStyle(fontSize: 22, fontFamily: 'Roboto', fontWeight: FontWeight.bold,),
        ),
      ),
      //1- we can dispinsing of (home:) property by adding home route 
      //to routes property
      //home: CategoriesScreen(),
      routes: {
        //2- such as next line    
        //(/) this by default refer to home screen
        
        //'/': (context) => TabScreen(),
        '/': (context) => BottomNavigationBarScreen(),
        CategoryMealsScreen.SCREEN_ROUTE : (context) => CategoryMealsScreen(),
        MealDetailsScreen.SCREEN_ROUTE: (context) => MealDetailsScreen(),
        FiltersScreen.RouteName: (context) => FiltersScreen(),
      },

      //if you want to change the home route key (/) 
      //to anything of your imagine, use initialRoute property
      //such as next line
      //initialRoute: '/home',

      //we can use onGenerateRoute if we use dynamic generate of screens
      //that we expect thay well make an error or we don;t know the sekonse
      //of display on screen.
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   //return the widget or default screen we create for this situtions
      //   //or depend on settings param that comes with onGenerateRoute method
      //   //return widget;
      // },

      //we can use also onUnknownRoute as error screen such as
      //crash happend, a screen without data or a problem in
      //network connection. this make it easy for use to make 
      //the app still running on screen without closing if any error happend
      // onUnknownRoute: (context){
      //   //return the widget or default screen we create for this situtions
      //   //return widget;
      // },
    );
  }
}
