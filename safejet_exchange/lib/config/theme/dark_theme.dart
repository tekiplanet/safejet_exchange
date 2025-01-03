import 'package:flutter/material.dart';
import 'colors.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: SafeJetColors.primaryAccent,
        scaffoldBackgroundColor: SafeJetColors.primaryBackground,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: SafeJetColors.primaryAccent,
          secondary: SafeJetColors.secondaryHighlight,
          background: SafeJetColors.primaryBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: SafeJetColors.secondaryBackground,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: SafeJetColors.textHighlight,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
} 