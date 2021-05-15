import 'package:flutter/material.dart';

class AfterTab extends StatelessWidget {
final String title;
AfterTab(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DetailPage"),
      ),
      body: Center(child:Text(title)),
    );
  }
}
