import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quote.dart';

class DetailPage extends StatelessWidget {
  final position;

  const DetailPage({this.position});

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

            child: BlocBuilder<QuoteBloc, QuoteState>(
              builder: (context,state){
                if(state is QuoteDetailLoaded){
                  return Text(state.getQuoteDetail.quote,style: TextStyle(
                      fontSize: 40));
                }
                return Text("Detail Page:error");
              },

              ),
            ),


          ),

        ),
      );
  }
}
