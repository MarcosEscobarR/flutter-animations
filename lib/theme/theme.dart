import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkMode = false;
  bool _customMode = false;
  ThemeData _currentTheme;

  bool get darkMode => this._darkMode;
  bool get customMode => this._customMode;
  ThemeData get currentTheme => this._currentTheme;

  set darkMode(bool val) {
    this._darkMode = val;
    this._customMode = false;
    if (val) {
      this._currentTheme = ThemeData.dark();
    } else {
      this._currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customMode(bool val) {
    this._darkMode = false;
    this._customMode = val;
    this._currentTheme = ThemeData.light();

    notifyListeners();
  }
}