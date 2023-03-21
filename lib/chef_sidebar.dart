import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[200]),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.grey[200]),
              ),
              onTap: () {
                // TODO: implement home menu functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.grey[200]),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.grey[200]),
              ),
              onTap: () {
                // TODO: implement profile menu functionality
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.account_balance_wallet, color: Colors.grey[200]),
              title: Text(
                'Wallet',
                style: TextStyle(color: Colors.grey[200]),
              ),
              onTap: () {
                // TODO: implement wallet menu functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu, color: Colors.grey[200]),
              title: Text(
                'Become a chef',
                style: TextStyle(color: Colors.grey[200]),
              ),
              onTap: () {
                // TODO: implement become a chef menu functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
