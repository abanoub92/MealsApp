import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../screens/filters_screen.dart';

class NavigationDrawer extends StatelessWidget {
  
  Widget drawerItem(IconData icon, String title, Function onClick){
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(
        title, 
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onClick,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Meals App',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),

          SizedBox(height: 20,),

          drawerItem(
            Icons.restaurant, 
            'Meals', 
            () => Navigator.of(context).pushNamed('/'),
          ),

          drawerItem(
            Icons.settings, 
            'Filters', 
            () => Navigator.of(context).pushNamed(FiltersScreen.RouteName)
          )
        ],
      ),
    );
  }
}