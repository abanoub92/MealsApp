import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const RouteName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _customSwitch({String title, String description, bool currentValue, Function updateValue}){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue, 
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: (){
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: <Widget>[
          //filters title
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline,
            ),
          ),

          //filters switches
          Expanded(
            child: ListView(
              children: <Widget>[
                //gluten-free switch
                _customSwitch(
                  title: 'Gluten Free',
                  description: 'Only include gluten-free meals.',
                  currentValue: _glutenFree,
                  updateValue: (newValue){
                    setState(() {
                      _glutenFree = newValue;
                    });                   
                  },
                ),

                //Vegetarian switch
                _customSwitch(
                  title: 'Vegetarian',
                  description: 'Only include vegetarian meals.',
                  currentValue: _vegetarian,
                  updateValue: (newValue){
                    setState(() {
                      _vegetarian = newValue;
                    });                   
                  },
                ),

                //Vegan switch
                _customSwitch(
                  title: 'Vegan',
                  description: 'Only include vegan meals.',
                  currentValue: _vegan,
                  updateValue: (newValue){
                    setState(() {
                      _vegan = newValue;
                    });                   
                  },
                ),
                
                //Lactose-free switch
                _customSwitch(
                  title: 'Lactose Free',
                  description: 'Only include lactose-free meals.',
                  currentValue: _lactoseFree,
                  updateValue: (newValue){
                    setState(() {
                      _lactoseFree = newValue;
                    });                   
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}