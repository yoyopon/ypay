import 'package:flutter/material.dart';
import 'package:ypay/dataService/loginRepository.dart';
import 'package:ypay/dbHelper/DatabaseHelper.dart';

abstract class UserProfileContract{
  void showError(String msg);
  void showMessage();
  void logOutSuccess();
  void deleteSuccess();
}

class UserProfilePresenter{
  UserProfileContract _contract;
  LoginRepostory _repostory;
  var db=DBHelper();

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

  void deleteFromDB(){
    db.deleteUserInfo().then((success){
      _contract.deleteSuccess();
    }).catchError((e){
      _contract.showError(e.toString());
    });
  }

}