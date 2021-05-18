import 'package:flutter/material.dart';
import '../models/QuoteModel.dart';
//import 'package:project4/models/QuoteModel.dart';
Widget CtagoryDetailPageContent(List<QuoteModel> quotes)
{
  return SizedBox(
    height: 500,
    child: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            return Container(
              // height: 100,
              // width: 100,
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
                      subtitle: Text(quotes[index].tag),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
  );
}