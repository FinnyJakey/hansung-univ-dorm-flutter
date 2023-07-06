import 'package:flutter/material.dart';
import 'package:hansungunivdorm/providers/theme/theme_state.dart';
import 'package:state_notifier/state_notifier.dart';

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider() : super(ThemeState.initial());

  void changeTheme() {
    if (state.currentTheme == ThemeData.light()) {
      state = state.copyWith(currentTheme: ThemeData.dark());
    } else {
      state = state.copyWith(currentTheme: ThemeData.light());
    }
  }
}
