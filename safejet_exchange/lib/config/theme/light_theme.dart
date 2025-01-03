import 'package:flutter/material.dart';
import 'colors.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: SafeJetColors.primaryAccent,
        scaffoldBackgroundColor: SafeJetColors.lightBackground,
        colorScheme: const ColorScheme.light().copyWith(
          primary: SafeJetColors.primaryAccent,
          secondary: SafeJetColors.secondaryHighlight,
          background: SafeJetColors.lightBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: SafeJetColors.primaryAccent),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: SafeJetColors.primaryAccent,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: SafeJetColors.lightText,
            fontSize: 16,
          ),
        ),
      );
} 