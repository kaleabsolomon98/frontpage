import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quote.dart';
import 'package:project4/blocs/quoteBloc/quoteBloc.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/screens/DetailPage.dart';
import 'package:project4/screens/HomePage.dart';



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
                borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: Column(
              children: <Widget>[
                 ListTile(
                  leading: Icon(Icons.album, size: 50),
                  title: Text(quotes[index].quote),
                  subtitle: Text(quotes[index].tag),
                   onTap: (){
                     BlocProvider.of<QuoteBloc>(context).add(QuoteDetailEvent(index));
                     Navigator.of(context).push(MaterialPageRoute(builder:(_) => DetailPage()));
                   }
                   ,
                ),
              ],
            ),
          ),
        );

      },

    ),
  );
}
