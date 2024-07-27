import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //llgin method
  void login() async {

    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }

    catch(e) {
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) => AlertDialog(title: Text(e.toString()),
      ),
      );
    }
    //navigate to home page
    Navigator.push(
      // ignore: use_build_context_synchronously
      context, 
      MaterialPageRoute(
        builder: (context) => const HomePage(), 
    ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo

            Icon(
              Icons.delivery_dining_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            //message/slogan

            const SizedBox(height: 25),

            Text(
              "Beattles BBQ",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            
            //email text field

            const SizedBox(height: 25),


            MyTextfield(
              controller: emailController, 
              hintText: "Email:", 
              obscureText: false
              ),


            //password text field

            const SizedBox(height: 10),


            MyTextfield(
              controller: passwordController, 
              hintText: "Password:", 
              obscureText: true,
              ),


            //sign in button 

            const SizedBox(height:10),

            MyButton(
              text: "Sign In", 
              onTap: login,
              ),


            //not a member
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?", 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Now", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary, 
                      fontWeight: FontWeight.bold)
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
