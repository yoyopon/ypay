import 'package:flutter/material.dart';
import 'package:ypay/dataService/loginRepository.dart';

abstract class UserProfileContract{
  void showError(String msg);
  void showMessage();
  void logOutSuccess();
}

class UserProfilePresenter{
  UserProfileContract _contract;
  LoginRepostory _repostory;

  UserProfilePresenter(UserProfileContract loginContract,BuildContext context){
    this._contract=loginContract;
    this._repostory=new LoginRepostory(context);
  }
  
  void signOutFromFacebook(){
    _repostory.fbSignOut().then((succeess){
      _contract.logOutSuccess();
    }).catchError((e){
      _contract.showError(e.toString());
    });
  }

  void signOutFromGoogle(){
    _repostory.googleSingout().then((success){
      _contract.logOutSuccess();
    }).catchError((e){  
      _contract.showError(e.toString());
    });
  }

}