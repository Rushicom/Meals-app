import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
 final void Function(BuildContext context, Meal meal) onSelectMeal;

  // ignore: non_constant_identifier_names
  String get ComplexityText{ // it is inenum value and we want to first letter in uppercase of complexity text that reason we used. and in the next + operator used to next letter
      return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);// and subtring is used to where youe want to starting he letter 
  }

  String get affordabilityText{ //same it is used for affordibility
      return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip
          .hardEdge, // stack is ignor the shape we changed that reason in this it is force to add shape
      elevation: 6, // it is used to slightly drop shadow behind the card
      child: InkWell(
        onTap:(){
          onSelectMeal(context, meal);
        },
        child: Stack(
          // multipale widgets are positioned on top of each other of each other along the z-axis , not colun diraction(Y - axis)
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                //that display an image thats faded.
                placeholder: MemoryImage(
                  kTransparentImage,
                ), // MemoryImage is used to knows how to load imag form memiry.
                image: NetworkImage(
                  meal.imageUrl, //network image it is feath image form network
                ),
                fit: BoxFit.cover, // to make shure image are not distorted
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2, //no more then two lines
                      textAlign: TextAlign.center,
                      softWrap: true, //text are wrapped in good looking way
                      overflow: TextOverflow
                          .ellipsis, // overflow which control how text will be cut off and text are very long then it will be cuoff with dot exm: ....
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(// mealitemtrait.dart constructor function are called
                          icon: Icons.schedule,
                          label: '${meal.duration}' ,
                        ),
                       const SizedBox(width: 12,),

                        MealItemTrait (
                          icon: Icons.work,
                          label: ComplexityText,
                        ),

                         const SizedBox(width: 12,),

                        MealItemTrait (
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
