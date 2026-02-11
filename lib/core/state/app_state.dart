import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String _title = "Invoice builder";

  String get title => _title;

  void setTitle(String txt) {
    _title = txt;
    notifyListeners();
  }
}
