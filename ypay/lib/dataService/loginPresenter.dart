import 'package:flutter/material.dart';
import 'package:ypay/dataService/loginRepository.dart';
import 'package:ypay/main.dart';
import 'package:ypay/model/userInfo.dart';

abstract class LoginContract{
  void showError(String msg);
  void showMessage();
  void loginSuccess(UserInfo data);
}

class LoginPresenter{
  LoginContract _contract;
  LoginRepostory _repostory;

  LoginPresenter(LoginContract loginContract,BuildContext context){
    this._contract=loginContract;
    this._repostory=new LoginRepostory(context);
  }
  
  void loginWithFacebook(){
    _repostory.initiateFacebookLogin().then((result){
      if(result!=null){
        switch(result.msg){
          case "Login Error": _contract.showError(result.msg);break;
          case "Login Cancelled By User": _contract.showError(result.msg);break;
          case "Login Success":_contract.loginSuccess(result);
        }
      }
    }).catchError((e)
    {
      _contract.showError(e.toString());
    });
  }

  void loginWithGoogleAcc(){
    _repostory.googleSignin().then((result){
      if(result!=null){
        if(result.msg=="Login Success"){
          _contract.loginSuccess(result);
        }
        else{
          _contract.showError(result.msg);
        }
      }
    }).catchError((onError){
      _contract.showError(onError.toString());
    });
  }

  // void changeLanguage(BuildContext context,Locale type){
  //   Locale _appLocale ;
  //     switch (type.languageCode) {
  //       case "en":_appLocale=new Locale('en','US');break;
  //       case "my":_appLocale=new Locale('my','MM');break;
  //       case "zh":_appLocale=new Locale('zh','CN');break;
  //       default:_appLocale=new Locale('en','US');break;
  //     }
  //     MyApp.setLocale(context,_appLocale);
  // }

}