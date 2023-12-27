import 'package:flutter/material.dart';
class NumberProvider with ChangeNotifier {
  int n1 = 2;
  int n2 = 2;
  int result = 0;

  NumberProvider() {
    result = n1 + n2;
  }

  void updateResult(int newResult) {
    result = newResult;
    notifyListeners();
  }
}

class ChangeNameProvider extends ChangeNotifier {
  String Name = 'Varma';

  String get NewName => Name;

  void changeUserName(String newUserName) {
    Name = newUserName;
    notifyListeners();
  }
}