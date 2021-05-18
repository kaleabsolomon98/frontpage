import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quote.dart';
import 'package:project4/screens/HomePage.dart';

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
        onTap: (){
          BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Inspirational"));
        },
      ),
      ListTile(
        title: Text("Friends"),
        trailing: Icon(Icons.star),
        onTap: (){
          BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Friends"));
        },
      ),
      ListTile(
        title: Text("School"),
        trailing: Icon(Icons.star),
        onTap: (){
          BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("School"));
        },
      ),
      ListTile(
        title: Text("Awkward"),
        trailing: Icon(Icons.star),
        onTap: (){
          BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Awkward"));
        },
      ),
      ListTile(
        title: Text("Book"),
        trailing: Icon(Icons.star),
        onTap: (){},
      ),
      ListTile(
        title: Text("Family"),
        trailing: Icon(Icons.star),
        onTap: (){
          BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Family"));
        },
      ),
      ListTile(
        title: Text("Holiday"),
        trailing: Icon(Icons.star),
        onTap: (){
          BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Holiday"));
        },
      ),
    ],

  );
}