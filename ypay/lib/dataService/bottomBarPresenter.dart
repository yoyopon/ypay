import 'package:flutter/material.dart';
import 'package:ypay/dbHelper/DatabaseHelper.dart';
import 'package:ypay/model/userInfo.dart';

abstract class BottomBarContract{
  void showError(String msg);
  void loadUserSuccess(UserInfo data);
}

class BottomBarPresenter{
  BottomBarContract _contract;
  var db=DBHelper();

  BottomBarPresenter(BottomBarContract loginContract,BuildContext context){
    this._contract=loginContract;
  }

  void getUserData(){
    db.getUserInfo().then((result){
      _contract.loadUserSuccess(result);
    }).catchError((e){
      _contract.showError(e);
    });
  }

}