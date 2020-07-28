import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ypay/Login/PhoneAuthfromF&G.dart';
import 'package:ypay/Login/ResetPassword.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ypay/dbHelper/DatabaseHelper.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class SMSVerifyMtq extends StatefulWidget {
  final String verifycode;
  final String pinfo;
  final String phoneNo;
  SMSVerifyMtq(this.verifycode,this.pinfo,this.phoneNo) : super();

  @override
  SMSVerifyMtqState createState() => SMSVerifyMtqState();
}

class SMSVerifyMtqState extends State<SMSVerifyMtq> {
  @override
  void initState() {
    startTimer();
    hideWidget();
    super.initState();
  }
///For Visible Invalid Code
  bool viewVisible = true;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold");
  TextStyle styleGrey=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "normal","none","nobold");
  bool loginSuccessIcon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(AppLocalizations.of(context).translate("verify"),
              style: styleWhite),
        ),
        body: Center(
          child: loginSuccessIcon == true
              ? Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100.0,
                )
              : Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ShowList(),
                ),
        ),
      ),
    );
  }
///For ShowList
  Widget ShowList() {
    return ListView(
      children: <Widget>[
        VerifyText(),
        SizedBox(
          height: 20.0,
        ),
        CodeBox(),
        SizedBox(
          height: 5.0,
        ),
        invalidCode(),
        SizedBox(
          height: 5.0,
        ),
        timerBox(),
        SizedBox(
          height: 6.0,
        ),
        ConfirmButtom(),
        SizedBox(
          height: 10.0,
        ),
        KeyBoard(),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  ///For Mobile Text
  Widget VerifyText() {
    return Container(
      child: Text(
        AppLocalizations.of(context).translate("enter6digit"),
        textAlign: TextAlign.center,
        style: styleGrey
      ),
    );
  }

  ///For Code Single Box
  String text = '';
  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  /// For Code Multiple Box
  Widget CodeBox() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          otpNumberWidget(0),
          otpNumberWidget(1),
          otpNumberWidget(2),
          otpNumberWidget(3),
          otpNumberWidget(4),
          otpNumberWidget(5),
        ],
      ),
    );
  }

  ///For Invalid Code
  invalidCode() => Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: viewVisible,
      child: Container(
          width: ScreenUtil().setWidth(100),
          height: ScreenUtil().setHeight(80),
          //color: Colors.green,
          child: Center(
              child: Text('Invalid Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 23,
                      fontFamily: 'EucrosiaUPC')))));

  ///For Confirm Buttom
  Widget ConfirmButtom() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      constraints: const BoxConstraints(maxWidth: 500),
      child: RaisedButton(
        onPressed: () {
          print('text' + this.text);
          print('code' + this.widget.verifycode);
          if (this.text == this.widget.verifycode) {
            setState(() {
              loginSuccessIcon = true;
            });
            this.widget.pinfo=="forget"?
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ResetPassword())):
            goBackToHome();
          } else {
            return showWidget();
          }
        },
        color: Colors.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(AppLocalizations.of(context).translate("confirm"),
                style: styleWhite
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  goBackToHome()async{
    var prefs = await SharedPreferences.getInstance();
    String prev=prefs.getString("previousPage");
    if(prev=="AccountProfile"){
      //UserInfo info=new UserInfo();
     // UserInfo.userInfo.phone=this.widget.phoneNo;
      DBHelper dbHelper=DBHelper();
      dbHelper.updatePhoneNumber(UserInfo.userInfo, this.widget.phoneNo);
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomTabBar()));
    }
  }

  ///For KeyBoard
  Widget KeyBoard() {
    return Container(
      child: NumericKeyboard(
        onKeyboardTap: _onKeyboardTap,
        textColor: Colors.green,
        rightIcon: Icon(
          Icons.backspace,
          color: Colors.green,
        ),
        rightButtonFn: () {
          setState(() {
            text = text.substring(0, text.length - 1);
          });
        },
      ),
    );
  }

  ///For Timer Box
  Widget timerBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 0, 10, 0),
      child: Container(
        width: ScreenUtil().setWidth(50),
        height: ScreenUtil().setHeight(80),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
            "$_start" + ' s',
            style: TextStyle(color: Colors.red),
              ),
          ),
        ),
      ),
    );
  }

  ///For CountDown Timer
  Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start == 0) {
            showDialog(
              builder: (context) => AlertDialog(
                title: Text(
                  'Your Verification Code is time out.\nPlease re-enter your phone number',
                  style: TextStyle(
                      fontFamily: "EucrosiaUPC",
                      fontSize: 25,
                      color: Colors.red),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _timer.cancel();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneAuthfromFG(),
                          ));
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: "EucrosiaUPC",
                          fontSize: 25),
                    ),
                  )
                ],
              ),
              context: context,
            );
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
