import 'package:flutter/material.dart';
import 'package:project4/blocs/quoteBloc/quoteBloc.dart';
import 'package:project4/blocs/quoteBloc/quoteState.dart';
import 'package:project4/blocs/quoteBloc/quoteEvent.dart';
import 'package:project4/repository/quoteRepository.dart';
//import '../repository/quoteRepository.dart';
import '../widgets/CatagoryDetailPageContent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:project4/repository/quoteRepository1.dart';
//import '../blocs/quoteBlocTag.dart';
//import '../blocs/quoteStateTag.dart';
//import '../blocs/quoteEventTag.dart';
//import '../blocs/quoteTag.dart';
import '../blocs/quoteBloc/quote.dart';

void main() {
  runApp(CatagoryDetail());
}


class CatagoryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
         //backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text("Teen Quote"),
        ),
        body: BlocProvider(
            create: (BuildContext context) => QuoteBloc(QuoteRepository())..add(FetchQuoteByTag('love')),
            child: CatagoryDetail1()
        ),

         //this will just add the Navigation Drawer  Icon
      ),
    );
  }

}

class CatagoryDetail1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
   {
   final quoteBloc = BlocProvider.of<QuoteBloc>(context);
   return Column(children:<Widget>[BlocBuilder<QuoteBloc, QuoteState>(     

            builder: (context, state) {
           if (state is QuoteIsNotLoaded) {
             return Container(
               child: Center(
                 child: Text("Error Loading Data"),
               ),
             );
           } 
            if (state is QuoteIsLoading) 
           {
             print("Kaleaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
           //  return CtagoryDetailPageContent(state.getQuotesTag);
             return Center(child: CircularProgressIndicator());
             
           }
            if(state is QuoteIsLoaded)
           {
             print("kallllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
             return CtagoryDetailPageContent(state.getQuotes);
           }
         //  return CtagoryDetailPageContent(QuoteRepository().getQuotesTag());
          return Center(child: CircularProgressIndicator());
           }
   )]);
   
   }
}
