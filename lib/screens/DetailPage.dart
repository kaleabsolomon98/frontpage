import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teen Quote"),
        ),

        body: Center(
          child: Container(
            child: Text('quote....',style: TextStyle(
                fontSize: 40
            ),),
          ),
        ),
      ),

    );
  }
}
