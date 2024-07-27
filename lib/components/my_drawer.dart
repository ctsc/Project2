import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  
  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [

          //app logo

            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Icon(
                Icons.dining_sharp,
                size: 95,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),


          //home 

          MyDrawerTile(
            text: "HOME", 
            icon: Icons.house_sharp, 
            onTap: () => Navigator.pop(context),
          ),


          //settings 
          
          MyDrawerTile(
            text: "SETTINGS", 
            icon: Icons.settings_accessibility_sharp, 
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: 
                (context) => const SettingsPage()
                ),
              );
            },
          ),
          const Spacer(),

          //log out 

          MyDrawerTile(
            text: "LOG OUT", 
            icon: Icons.exit_to_app_sharp, 
            onTap: logout,
                
          ),
          const SizedBox(height: 25),
        ],
      )
    );
  }
}