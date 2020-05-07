import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import './screens/filters_screen.dart';
import './screens/bottom_navigation_bar_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if (_filters['gluten'] && !meal.isGlutenFree)
          return false;

        if (_filters['lactose'] && !meal.isLactoseFree)
          return false;

        if (_filters['vegan'] && !meal.isVegan)
          return false;

        if (_filters['vegetarian'] && !meal.isVegetarian)
          return false;

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingMealIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingMealIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingMealIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

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
        '/': (context) => BottomNavigationBarScreen(_favoriteMeals),
        CategoryMealsScreen.SCREEN_ROUTE : (context) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.SCREEN_ROUTE: (context) => MealDetailsScreen(_isMealFavorite, _toggleFavorite),
        FiltersScreen.RouteName: (context) => FiltersScreen(_filters, _setFilters),
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
