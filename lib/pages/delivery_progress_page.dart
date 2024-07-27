import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/services/database/firestore.dart';
import 'package:provider/provider.dart';


class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  FirestoreService db = FirestoreService();



  @override
  void initState(){
    super.initState();

    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress..'),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(children: [
        MyReceipt(),
      ],)
    );
  }

  //custom bnuttom nav bar call delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
        Container(decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.person),
            ),
        ),
        //driver details
        Column(
          children: [
            Text(
              "Brandy Johnson",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                )
              )
            ],
        ),


        Row(
          children: [
            //message button
        Container(decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.message_sharp),
            color: Theme.of(context).colorScheme.primary,
            ),
        ),
        const SizedBox(width: 10),

        //call button
        Container(decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.call_sharp),
            color: Colors.green,
            ),
        ),






          ],
        ),


      ],
      ),
    );
  }
}