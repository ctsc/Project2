import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void register() async{
    final authService = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      }
      catch (e) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    else {
      showDialog(context: context, builder: (context) => const AlertDialog(title: Text("Passwords don't match"),
      ),
    );
    }
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
              "Let's Get You Signed Up ",
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

            // confirm password text field
            const SizedBox(height: 10),


            MyTextfield(
              controller: confirmPasswordController, 
              hintText: "Confirm Password:", 
              obscureText: true,
              ),



            //sign in button 

            const SizedBox(height:10),

            MyButton(
              text: "Sign Up", 
              onTap: register,
              ),


            // ?already have an account 
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?", 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Now", 
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

