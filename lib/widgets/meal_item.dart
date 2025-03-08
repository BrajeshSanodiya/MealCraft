
import 'package:flutter/material.dart';
import 'package:meal_craft/models/meal.dart';
import 'package:meal_craft/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
const MealItem({super.key, required this.meal, required this.onMealSelected});

final Meal meal;

final Function() onMealSelected;

String get complexityText {
  return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
}

String get affortabilityText {
  return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
}

@override
  Widget build(BuildContext context) {
    
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,

      child: InkWell(
        onTap: onMealSelected,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        MealItemTrait(lable: '${meal.duration} min', icon: Icons.schedule),
                        SizedBox(width: 12,),
                        MealItemTrait(lable: complexityText, icon: Icons.work),
                         SizedBox(width: 12,),
                        MealItemTrait(lable: affortabilityText, icon: Icons.attach_money)
                   
                      ],)
                    ],
                  ),
            ))
          ],
        ),
      ),
    );
  }

}