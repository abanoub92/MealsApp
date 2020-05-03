import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';

class FiltersScreen extends StatelessWidget {

  static const RouteName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('This is filters screen...'),
      ),
    );
  }
}