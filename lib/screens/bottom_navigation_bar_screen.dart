import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';
import '../models/meal.dart';

class BottomNavigationBarScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  BottomNavigationBarScreen(this.favoriteMeals);

  @override
  _BottomNavigationBarScreenState createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  int _selectedPageIndex = 0;

  List<Map<String, Object>> _pages;

  @override
  void initState() {
  _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'},
  ];
    super.initState();
  }

  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: NavigationDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}