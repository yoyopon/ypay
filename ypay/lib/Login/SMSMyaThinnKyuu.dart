import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:ypay/Login/PhoneAuthfromF&G.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'dart:async';

import 'package:ypay/Page/HomePage.dart';

class SMSVerifyMtq extends StatefulWidget {
  String verifycode;
  SMSVerifyMtq(this.verifycode) : super();

  @override
  SMSVerifyMtqState createState() => SMSVerifyMtqState();
}

class SMSVerifyMtqState extends State<SMSVerifyMtq> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  // autoverify() {
  //   this.text = this.widget.verifycode;
  //   if (this.text != null) {
  //     //Icon(Icons.check_circle);
  //     // return Navigator.push(context,
  //     //     MaterialPageRoute(builder: (context) => SMSVerifyMtq(this.text)));
  //   }
  // }
  bool loginSuccessIcon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Verification Code Sent",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "EucrosiaUPC",
                  fontSize: 30)),
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

  Widget ShowList() {
    return ListView(
      children: <Widget>[
        VerifyText(),
        SizedBox(
          height: 20.0,
        ),
        CodeBox(),
        SizedBox(
          height: 20.0,
        ),
        TimerBox(),
        SizedBox(
          height: 20.0,
        ),
        ConfirmButtom(),
        SizedBox(
          height: 30.0,
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
        'Enter 6 digits verification code sent to your phone number',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 30,
          fontFamily: 'EucrosiaUPC',
        ),
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => BottomTabBar()));
          } else {
            return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: Text(
                          'Invalid Code',
                          style: TextStyle(color: Colors.red),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SMSVerifyMtq(this.widget.verifycode),
                                  ));
                            },
                          ),
                        ]));
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
              Text(
                'Confirm',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'EucrosiaUPC',
                    fontSize: 28.0),
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
  Widget TimerBox() {
    return Container(
      child: Text(
        "$_start" + ' s',
        style: TextStyle(color: Colors.red),
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
