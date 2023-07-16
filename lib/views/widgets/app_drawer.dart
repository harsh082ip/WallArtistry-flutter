import 'package:flutter/material.dart';

import '../screens/developers_about_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.amber),
          accountName: Text(
            "Hello User",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          accountEmail: Text(''),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DevelopersAboutScreen()));
          },
          leading: Icon(Icons.info),
          title: Text('About the Developer'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.star_border),
          title: Text('Rate this App 😊'),
        )
      ],
    ));
  }
}
