import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/Theme/ChangeThemeBloc.dart';
import 'package:project4/blocs/quoteBloc/quoteBloc.dart';
import 'package:project4/blocs/quoteBloc/quoteEvent.dart';
import 'package:project4/models/QuoteModel.dart';

Widget homePageContent(List<QuoteModel> quotes) {
  List<String> tags = ["Love","Friend","Music","Book","Family","Holiday","Awkward","School"];
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (BuildContext context, int index) => Card(
            color: Colors.black,
            child: Center(
              child: TextButton(
                style:TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: (){
                    BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag(tags[index]));
                },
                child: Text(tags[index],style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 546.9545,
        child: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.album, size: 50,color: Colors.black,),
                        title: Text(quotes[index].quote),
                        subtitle: Text(quotes[index].tag,style: changeThemeBloc.state.themeData.textTheme.bodyText1),
                        onTap: () {
//                     BlocProvider.of<QuoteBloc>(context).add(FetchQuoteByTag("Love"));
//                     Navigator.of(context).push(MaterialPageRoute(builder:(_) => DetailPage()));
                        }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
