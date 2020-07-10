import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ypay/APIService/SMSVerify.dart';
import 'package:ypay/Login/SMSMyaThinnKyuu.dart';
import 'package:ypay/dataService/loginPresenter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PhoneAuthfromFG extends StatefulWidget {
  PhoneAuthfromFGState createState() => PhoneAuthfromFGState();
}

class PhoneAuthfromFGState extends State<PhoneAuthfromFG> with LoginContract {
  bool loginLoading = false;
  String codeno;
  String phoneNo;
  final formKey = new GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  LoginPresenter _presenter;

  @override
  void initState() {
    _presenter = new LoginPresenter(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Phone Authentication",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "EucrosiaUPC",
                  fontSize: 30)),
        ),
        body: Center(
          child: loginLoading == true
              ? SpinKitRotatingCircle(
                  color: Colors.green,
                  size: 50.0,
                )
              : Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Form(
                    key: formKey,
                    child: ShowList(),
                  ),
                ),
        ),
      ),
    );
  }

  ///For ShowList
  Widget ShowList() {
    return ListView(
      children: <Widget>[
        MobileText(),
        SizedBox(height: 30.0),
        PhoneNumber(),
        SizedBox(height: 50.0),
        NextButtom()
      ],
    );
  }

  ///For Mobile Text
  Widget MobileText() {
    return Container(
      child: Text(
        'Enter Mobile Number to confirm your account',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 30,
          fontFamily: 'EucrosiaUPC',
        ),
      ),
    );
  }

  ///For Phone Number TextBox
  Widget PhoneNumber() {
    return Container(
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter your Phone Number!';
          }
          if (value.length < 6) {
            return 'Must be at least six charaters!';
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone, color: Colors.green),
            prefixText: '09  ',
            prefixStyle: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto Slab Regular",
                fontSize: 15.5),
            hintText: "Phone Number",
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Roboto Slab Regular"),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
        onChanged: (value) {
          //this.phoneNo = '+959'+value;
        },
      ),
    );
  }

  ///For Next Buttom
  Widget NextButtom() {
    return Container(
      child: RaisedButton(
        color: Color(0xff4AB055),
        onPressed: () {
          if (formKey.currentState.validate()) {
            setState(() {
              loginLoading = true;
            });

            ///Random number for verification code
            var rnd = new Random();
            var next = rnd.nextDouble() * 1000000;
            while (next < 100000) {
              next *= 10;
            }
            print(next.toInt());
            codeno = next.toInt().toString();
            phoneNo = '09' + phoneController.text.toString();
            print(phoneNo);

            ///Call API
            SMSVerify.SMSSent(phoneNo, codeno).then((success) {
              if (success != null) {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SMSVerifyMtq(this.codeno),
                    ));
              } else {
                showDialog(
                  builder: (context) => AlertDialog(
                    title: Text('Vaildate Phone Number'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Try Again',
                        ),
                      )
                    ],
                  ),
                  context: context,
                );
              } //end of else
            }); //apiservice end
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => OtpPage()));
          }
        },
        child: Text(
          'Next',
          style: TextStyle(
              fontSize: 30, fontFamily: 'EucrosiaUPC', color: Colors.white),
        ),
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  @override
  void showError(String msg) {
    // TODO: implement showError
  }

  @override
  void showMessage() {
    // TODO: implement showMessage
  }
}
