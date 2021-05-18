import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/repository/quoteRepository.dart';
import 'package:project4/screens/HomePage.dart';
import 'package:project4/screens/SplashScreen.dart';
import 'package:project4/widgets/DrawerContent.dart';

import 'blocs/quoteBloc/quoteBloc.dart';
import 'blocs/quoteBloc/quoteEvent.dart';

void main() async {
  runApp(
      BlocProvider(create: (BuildContext context) => QuoteBloc(QuoteRepository())..add(FetchQuote()),
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,

      initialRoute: '/splash',
      routes: {
        '/splash':(context) => SplashScreen(),
        '/home': (context) => HomePage(),
//        '/details': (context) => DetailsPage(),
      },


    );
  }



}
