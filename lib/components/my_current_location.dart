import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: const Text("Your Location"),
      content: const TextField(
        decoration: InputDecoration(hintText: "Search address.."),
        ),
        actions: [

          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          //save button

        ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text('Deliver Now',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, value, child) => Text(
                    "888 atl street",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  
                ),
                //drop down menu
                const Icon(Icons.keyboard_arrow_down_sharp),
            ],
            
            ),
          )
        ],
      ),
    );
  }
}