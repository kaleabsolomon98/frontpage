import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final text;
  const ErrorDisplayWidget({this.text});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Teen Quote'),
        ),
        body: Center(
          child: Text(
            '$text'
          ),
        ),

      ),

    );
  }
}
