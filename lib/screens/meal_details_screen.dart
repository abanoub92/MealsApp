import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {

  static const SCREEN_ROUTE = '/meal_details';

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailsScreen(this.isMealFavorite, this.toggleFavorite);

  Widget titleWidget(BuildContext context, String title){
      return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 10, left: 10),
        child: Text(title, style: Theme.of(context).textTheme.headline,),
      );
    }

    Widget listStyleWidget(Widget child){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey,),
        ),
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        child: child,
      );
    }

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //image container
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover,),
            ),

            //ingredient
            titleWidget(context, 'Ingredient'),
            listStyleWidget(
              ListView.builder(itemBuilder: (ctx, index){
                return Card(
                  color: Theme.of(ctx).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(meal.ingredients.elementAt(index), style: Theme.of(ctx).textTheme.subhead,),
                  ),
                );
              }, itemCount: meal.ingredients.length,),
            ),

            //steps
            titleWidget(context, 'Steps'),
            listStyleWidget(
              ListView.builder(itemBuilder: (ctx, index){
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${(index + 1)}'),),
                      title: Text(meal.steps.elementAt(index)),
                    ),
                    Divider(),
                  ],
                );
              }, itemCount: meal.steps.length,),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          toggleFavorite(meal.id);
        },
        child: Icon(
          isMealFavorite(meal.id) ? Icons.star : Icons.star_border
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}