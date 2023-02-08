import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AppThemeCubit extends Cubit<ThemeData> {
  AppThemeCubit() : super(ThemeData.light(useMaterial3: true));

  void changeTheme() {
    if (state == ThemeData.light(useMaterial3: true)) {
      emit(ThemeData.dark(useMaterial3: true));
    } else {
      emit(ThemeData.light(useMaterial3: true));
    }
  }
}
