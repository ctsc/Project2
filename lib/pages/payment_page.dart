import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cvvCode = '';
  String cardHolderName = '';
  bool isCvvFocused = false;



  //user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show if cc form is valid 
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment?"),
          content: Column(
            children: [
              SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text("Card Number: $cardNumber"),
                    Text("Expiry Date: $expiryDate"),
                    Text("Card Holder Name: $cardHolderName"),
                    Text("CVV: $cvvCode"),
                  ],
                ),
              ),
            ],
          ),
        actions: [
            //cancel button
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancel'),
              ),

          //yes button
          TextButton(
            onPressed: () { 
              Navigator.pop(context);
              Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const DeliveryProgressPage(),
            ),
            );
            },
              child: const Text('Yes'),
          ),
        ],

        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          //credit card
        CreditCardWidget(
          cardNumber: cardNumber, 
          expiryDate: expiryDate, 
          cardHolderName: cardHolderName, 
          cvvCode: cvvCode, 
          showBackView: isCvvFocused, 
          onCreditCardWidgetChange: (p0) {},
          ),
        
        //credit card form
        CreditCardForm(
          cardNumber: cardNumber, 
          expiryDate: expiryDate, 
          cardHolderName: cardHolderName, 
          cvvCode: cvvCode, 
          onCreditCardModelChange: (data) {
            setState(() {
              cardNumber = data.cardNumber;
              expiryDate = data.expiryDate;
              cardHolderName = data.cardHolderName;
              cvvCode = data.cvvCode;
            });

          }, 
          formKey: formKey,
          ),
        const Spacer(),

        MyButton(
          text: "Pay Now", 
          onTap: userTappedPay,
        ),

      const SizedBox(height: 25),

        ],
      ),
    );
  }
}