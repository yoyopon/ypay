import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier {
  int currentIndex = 1;int showError=0;

  get _currentIndex => currentIndex;
  get _showError => showError;

  void increment(){
    currentIndex++;
    notifyListeners();
  }

  void decrement(){
    currentIndex--;
    if(currentIndex<=0){
      currentIndex=1;
      showError=1;
    }
    else{
      showError=0;
    }
    notifyListeners();
  }

}

