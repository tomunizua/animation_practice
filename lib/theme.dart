import 'package:flutter/material.dart';

// Class to define light and dark themes
class MyTheme {
  // Light theme configuration
  static final lightTheme = ThemeData(
    // Using a pink color scheme with Material 3 support
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
    useMaterial3: true,
    brightness: Brightness.light, // Light mode
    primaryColor: Colors.pink, // Primary color is pink
  );

  // Dark theme configuration
  static final darkTheme = ThemeData(
    // Using a pink color scheme with Material 3 support for dark mode
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink, brightness: Brightness.dark),
    useMaterial3: true,
    brightness: Brightness.dark, // Dark mode
    primaryColor: Colors.pink, // Primary color is pink
  );
}
