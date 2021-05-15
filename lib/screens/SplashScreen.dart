import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quote.dart';
import 'package:project4/screens/HomePage.dart';
import 'package:project4/widgets/SplashScreenWidget.dart';



// This the widget where the BLoC states and events are handled.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final quoteBloc = BlocProvider.of<QuoteBloc>(context);

    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: Colors.white,
      child: Center(
        child: BlocBuilder<QuoteBloc, QuoteState>(
          builder: (context, state) {
            if (state is QuoteIsLoading) {
              return SplashScreenWidget();
            } else if (state is QuoteIsLoaded) {
//               Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));
              //named
//              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              //not named
//              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
              return HomePage();
            } else if (state is QuoteIsNotLoaded) {
              return Container(
                child: Center(
                  child: Text("Error Loading Data"),
                ),
              );
            }
            return Container(
              child: Center(
                child: Text("Default:Error Loading Data"),
              ),
            );
          },
        ),
      ),
    );
  }
}