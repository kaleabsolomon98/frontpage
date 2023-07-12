import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/Example/postBlocTest.dart';
import 'package:project4/blocs/Example/postEvent.dart';
import 'package:project4/blocs/quoteBloc/quote.dart';
import 'package:project4/screens/HomePage.dart';
import 'package:project4/screens/settings.dart';
import 'package:project4/screens/testScreen/DisplayContentPage.dart';
import 'package:project4/screens/testScreen/testDisplayScreen.dart';

Widget drawerContent(BuildContext context){
  return Column(
    children: [
      Expanded(
        child: ListView(
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
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS ? Colors.blue : Colors.white,
                  child: Text(
                    "S",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),

              ],
              onDetailsPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => SettingsPage()));
              },
            ),

            ListTile(
              title: Text("Love"),
              trailing: Icon(Icons.star),
              onTap: (){
                BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Love"));
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));
              },
            ),
            ListTile(
              title: Text("Friends"),
              trailing: Icon(Icons.star),
              onTap: (){
                BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Friends"));
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));
              },
            ),
            ListTile(
              title: Text("Awkward"),
              trailing: Icon(Icons.star),
              onTap: (){
                BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Awkward"));
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));
              },
            ),
            ListTile(
              title: Text("Book"),
              trailing: Icon(Icons.star),
              onTap: (){
                BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Book"));
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));

              },
            ),
            ListTile(
              title: Text("Family"),
              trailing: Icon(Icons.star),
              onTap: (){
                BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Family"));
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));

              },
            ),
            ListTile(
              title: Text("Music"),
              trailing: Icon(Icons.star),
              onTap: (){
                BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Music"));
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));

              },
            ),
            ListTile(
              title: Text("PaginationTest"),
              trailing: Icon(Icons.star),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => TestDislayScreen()));

              },
            ),
          ],

        ),
      ),
    ],
  );
}