import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawerContent(BuildContext context){
  return ListView(
    children: [
      UserAccountsDrawerHeader(
        accountName: Text("James.d"),
        accountEmail: Text("dlavicRcor@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor:
          Theme.of(context).platform == TargetPlatform.iOS ? Colors.blue : Colors.white,
          child: Text(
            "J",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),

      ListTile(
        title: Text("Inspirational"),
        trailing: Icon(Icons.star),
      ),
      ListTile(
        title: Text("Famous"),
        trailing: Icon(Icons.star),
      ),
      ListTile(
        title: Text("scientific"),
        trailing: Icon(Icons.star),
      ),
      ListTile(

        title: Text("Love"),
        trailing: Icon(Icons.star),
      ),
    ],

  );
}