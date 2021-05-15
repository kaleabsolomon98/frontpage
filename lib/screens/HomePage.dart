import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quoteBloc.dart';
import 'package:project4/blocs/quoteBloc/quoteState.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/widgets/DrawerContent.dart';
import 'package:project4/widgets/HomePageContent.dart';

class HomePage extends StatelessWidget {
  final  List<QuoteModel> quote;

  const HomePage({this.quote});

  @override
  Widget build(BuildContext context) {
    final quoteBloc = BlocProvider.of<QuoteBloc>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teen Quote"),
        ),
        body: Column(
          children: [
            BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
              if (state is QuoteIsLoaded) {
                print("comes here:HOME PAGE: " + state.getQuotes[1].quote.toString());
                return homePageContent(state.getQuotes);
              }
              return Container(
                child: Center(
                  child: Text("Error Loading Data"),
                ),
              );
            }),

          ],
        ),


        drawer: Drawer(
            child:drawerContent(context)
        ), //
      ),
    );
  }
}
