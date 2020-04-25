import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {

  final Meal meal;

  MealItem(this.meal);

  String get complexityText{
    switch(meal.complexity){
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get affordabilityText{
    switch(meal.affordability){
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Expensive';

      default:
        return 'Unknown';
    }
  }

  void selectedMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      MealDetailsScreen.SCREEN_ROUTE,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //stack widget put childern widgets top of each other
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                //this widget cames with stack widget only
                //to determine the place of item in a stack
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.black54,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        meal.title, 
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //duration widget
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('${meal.duration} min')
                    ],
                  ),

                  //complexity widget
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text('$complexityText')
                    ],
                  ),

                  //affordability widget
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text('$affordabilityText')
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}