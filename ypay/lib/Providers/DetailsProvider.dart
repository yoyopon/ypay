import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier {
  int currentIndex = 1;

  get _currentIndex => currentIndex;

  void increment(){
    currentIndex++;
    notifyListeners();
  }

  void decrement(){
    currentIndex--;
    notifyListeners();
  }

}