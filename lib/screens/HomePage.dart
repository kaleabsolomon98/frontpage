import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quoteBloc.dart';
import 'package:project4/blocs/quoteBloc/quoteState.dart';
import 'package:project4/widgets/HomePageContent.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quoteBloc = BlocProvider.of<QuoteBloc>(context);

    return Column(
      children: [
        BlocBuilder<QuoteBloc, QuoteState>(

            builder: (context, state) {
          if (state is QuoteIsNotLoaded) {
            return Container(
              child: Center(
                child: Text("Error Loading Data"),
              ),
            );
          } else if (state is QuoteIsLoading) {
            return Center(child: CircularProgressIndicator());
          }else if(state is QuoteIsLoaded){
            return homePageContent(state.getQuotes);

          }
          return Center(child: CircularProgressIndicator());

            }),
      ],
    );
  }
}
