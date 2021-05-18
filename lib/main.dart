import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/repository/quoteRepository.dart';
import 'package:project4/screens/HomePage.dart';
import 'package:project4/widgets/DrawerContent.dart';

import 'blocs/quoteBloc/quoteBloc.dart';
import 'blocs/quoteBloc/quoteEvent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  //  var mediaQuery=MediaQuery.of(context);
      AppBar appBar=AppBar(
          title: Text("Teen Quote"));

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
         backgroundColor:const Color(0xffffff).withOpacity(1),
        appBar:appBar ,
        
         body:
          BlocProvider(
             create: (BuildContext context) => QuoteBloc(QuoteRepository())..add(FetchQuote()),
            child: HomePage(appBar)
          ),

        drawer: Drawer(
            child:drawerContent(context)
        ), //this will just add the Navigation Drawer  Icon
      ),
    );
  }



}
