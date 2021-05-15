import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/screens/aftertab.dart';

//class HomePageContent extends StatelessWidget {
//   QuoteModel quote;
//
//   HomePageContent({this.quote});
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Expanded(
//      child: ListView.builder(
//        itemCount: 20,
//        itemBuilder: (context, position) {
//          return Container(
//            height: 100,
//            width: 100,
//            child: Card(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(15.0),
//              ),
//              elevation: 10,
//              child: Column(
//                children: <Widget>[
//                   ListTile(
//                    leading: Icon(Icons.album, size: 50),
//                    title: Text(quote.quote_writer.toString()),
//                    subtitle: Text('TWICE'),
//                  ),
//                ],
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
//}

Widget homePageContent(List<QuoteModel> quotes) {
  return Expanded(
    child: ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                side: BorderSide(width: 5, color: Colors.green)),
            elevation: 5,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album, size: 50),
                  title: Text(quotes[index].quote_writer),
                  subtitle: Text(quotes[index].quote),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AfterTab(quotes[index].quote))),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
