
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Aktuel Katalog"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Marketler"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Filters"),
            onTap: () {
              //Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
         
        ],
      ),
    );
  }
}