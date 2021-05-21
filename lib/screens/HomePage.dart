import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/Example/postEvent.dart';
import 'package:project4/blocs/Theme/ChangeThemeBloc.dart';
import 'package:project4/blocs/quoteBloc/quote.dart';
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
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),

      home: Scaffold(

        appBar: AppBar(
          title: Text("Teen Quote"),
        ),
        body: RefreshIndicator(
          onRefresh: (){

            final itemsBloc = BlocProvider.of<QuoteBloc>(context)..add(QuoteEventRefresh());

            return itemsBloc.stream.firstWhere((e) => e is! QuoteEventRefresh);

          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<QuoteBloc, QuoteState>(
                  buildWhen: (previous, current) => current is QuoteIsLoaded,
                  builder: (context, state) {

                if (state is QuoteIsLoading) {
//                print("comes here:HOME PAGE: " + state.getQuotes[1].quote.toString());
                  return Center(child: LoadingWidget());
                }else if (state is QuoteIsLoaded){
                  return homePageContent(state.getQuotes);

                }else if(state is QuoteIsNotLoaded){
                  return ErrorDisplayWidget('Homepage(quote is not loaded): Error Loading Data');
                }
                return ErrorDisplayWidget('Home page: Error Loading Data');

              }),
            ],
          ),
        ),


        drawer: Drawer(
            child:drawerContent(context)
        ), //
      ),
    );
  }
}
