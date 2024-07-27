import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [

                // food description
              Expanded(
                child: Column(
                  children: [
                    Text(food.name),
                    Text(food.price.toString()),
                    Text(food.description),
                  ],
                 ),
                ),

                //food images
              Image.asset(food.imagePath, height: 120),


          ],
         ),
        )
      ],
    );
  }
}