import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quoteBloc.dart';
import 'package:project4/blocs/quoteBloc/quoteState.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/widgets/DrawerContent.dart';
import 'package:project4/widgets/ErrorDisplayWidget.dart';
import 'package:project4/widgets/HomePageContent.dart';
import 'package:project4/widgets/SplashScreenWidget.dart';

class HomePage extends StatelessWidget {
  final  List<QuoteModel> quote;

  const HomePage({this.quote});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teen Quote"),
        ),
        body: Column(
          children: [
            BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
              if (state is QuoteIsLoading) {
//                print("comes here:HOME PAGE: " + state.getQuotes[1].quote.toString());
                return LoadingWidget();
              }else if (state is QuoteIsLoaded){
                return homePageContent(state.getQuotes);

              }else if(state is QuoteIsNotLoaded){
                return ErrorDisplayWidget('Homepage(quote is not loaded): Error Loading Data');
              }
              return ErrorDisplayWidget('Home page: Error Loading Data');

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
