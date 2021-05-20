import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/Theme/ChangeThemeBloc.dart';
import 'package:project4/blocs/Theme/ChangeThemeEvent.dart';
import 'package:project4/blocs/Theme/ChangeThemeState.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: changeThemeBloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return Container(
          color: state.themeData.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text(
                  'Light Theme',
                  style: state.themeData.textTheme.bodyText1,
                ),
                onPressed: () {
                  changeThemeBloc.add(LightTheme());
                },
              ),
              ElevatedButton(
                child: Text(
                  'Dark Theme',
                  style: state.themeData.textTheme.bodyText1,
                ),
                onPressed: () {
                  changeThemeBloc.add(DarkTheme());
                },
              ),
              ElevatedButton(
                child: Text(
                  'Amoled Theme',
                  style: state.themeData.textTheme.bodyText1,
                ),
                onPressed: () {
                  changeThemeBloc.add(AmoledTheme());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

//dispatch(ChangeThemeEvent event,BuildContext context) {
//  BlocProvider.of<ChangeThemeBloc>(context).add(event);
//}



