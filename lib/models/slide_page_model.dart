import 'package:flutter/material.dart';

class SlidePageModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();  
  }
}
