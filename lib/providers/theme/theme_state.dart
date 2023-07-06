import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/shared_pref_model.dart';

class ThemeState extends Equatable {
  final ThemeData currentTheme;

  const ThemeState({
    required this.currentTheme,
  });

  factory ThemeState.initial() {
    return ThemeState(
        currentTheme:
            SharedPrefModel.darkMode ? ThemeData.dark() : ThemeData.light());
  }

  @override
  String toString() {
    return 'ThemeState{currentTheme: $currentTheme}';
  }

  @override
  List<Object?> get props => [currentTheme];

  ThemeState copyWith({
    ThemeData? currentTheme,
  }) {
    return ThemeState(
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }
}
