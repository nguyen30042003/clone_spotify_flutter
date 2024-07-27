import 'package:flutter/material.dart';

extension IsDarkMode on BuildContext{
  bool get checkDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}