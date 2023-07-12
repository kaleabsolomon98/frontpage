import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/Example/postBlocTest.dart';
import 'package:project4/blocs/Example/postEvent.dart';
import 'package:project4/repository/quoteRepository.dart';
import 'package:project4/screens/testScreen/DisplayContentPage.dart';

class TestDislayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
            create: (BuildContext context) => PostBloc()..add(Fetch()),
            child: DisplayContentPage()),
      ),
    );
  }
}
