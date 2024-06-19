import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order/components/drawerTile.dart';
import 'package:food_order/pages/settings.dart';
import 'package:food_order/services/auth/auth_service.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: Column(
          children: [
            const Icon(
              Icons.account_circle,
              size: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            DrawerTile(
              title: "Home",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),
            DrawerTile(
              title: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
            const Spacer(),
            DrawerTile(
              title: "Logout",
              icon: Icons.logout,
              onTap: () async {
                final _authServices = AuthService();
                await _authServices.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
