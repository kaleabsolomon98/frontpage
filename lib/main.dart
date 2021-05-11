import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.indigoAccent,
          appBar: AppBar(
            title: Center(
              child: Text(
                "Qoutes",
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
          body: ListViewHome(),
        ));
  }
}

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//......this is the other class called above"......../////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

class ListViewHome extends StatelessWidget {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/loadjson/details.json'),
        builder: (context, snapshot) {
          // Decode the JSON
          var newData = json.decode(snapshot.data.toString());
          return ListView.builder(
          
              itemCount: newData.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      side: BorderSide(width: 5, color: Colors.green)),
                  child: ListTile(
                    title: Text(
                      newData[index]['title'],
                    ),
                    subtitle: Text(newData[index]['gender']),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(newData[index]['img'])),
                    trailing: Icon(Icons.star),
                  ),
                );
              });
        });
  }
}
