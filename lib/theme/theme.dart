import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.grey[400],
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[800],
  );
}
