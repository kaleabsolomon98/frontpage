import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/Theme/ChangeThemeEvent.dart';
import 'package:project4/blocs/Theme/ChangeThemeState.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc() : super(ChangeThemeState.lightTheme());

  void onLightThemeChange() => dispatch(LightTheme());
  void onDarkThemeChange() => dispatch(DarkTheme());
  void onAmoledThemeChange() => dispatch(AmoledTheme());
  void onDecideThemeChange() => dispatch(DecideTheme());

  @override
  Stream<ChangeThemeState> mapEventToState(ChangeThemeEvent event) async* {
    if (event is DecideTheme) {
      final int optionValue = await getOption();
      if (optionValue == 0) {
        yield ChangeThemeState.lightTheme();
      } else if (optionValue == 1) {
        yield ChangeThemeState.darkTheme();
      } else if (optionValue == 2) {
        yield ChangeThemeState.amoledTheme();
      }
    }
    if (event is LightTheme) {
      yield ChangeThemeState.lightTheme();
      try {
        _saveOptionValue(0);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }

    if (event is DarkTheme) {
      yield ChangeThemeState.darkTheme();
      try {
        _saveOptionValue(1);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }

    if (event is AmoledTheme) {
      yield ChangeThemeState.amoledTheme();
      try {
        _saveOptionValue(2);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }
  }

  Future<Null> _saveOptionValue(int optionValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme_option', optionValue);
  }

  Future<int> getOption() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int option = preferences.get('theme_option') ?? 0;
    return option;
  }

  dispatch(ChangeThemeEvent event) {
//    BlocProvider.of<ChangeThemeBloc>(context).add(event);
  }
}

final ChangeThemeBloc changeThemeBloc = ChangeThemeBloc()..onDecideThemeChange();