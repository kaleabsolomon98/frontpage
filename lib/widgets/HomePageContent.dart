import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/QuoteModel.dart';



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
                  subtitle: Text("sub:" + quotes[index].tag),
                   onTap: (){
//                     BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Love"));
//                     Navigator.of(context).push(MaterialPageRoute(builder:(_) => DetailPage()));
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
