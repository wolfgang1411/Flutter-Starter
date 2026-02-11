import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String _title = "Invoice Builder";

  String get title => _title;

  void setTitle(String txt) {
    _title = txt;
    notifyListeners();
  }
}
