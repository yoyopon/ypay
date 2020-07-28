import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ypay/APIService/SMSVerify.dart';
import 'package:ypay/Login/SMSMyaThinnKyuu.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class PhoneAuthfromFG extends StatefulWidget {
  PhoneAuthfromFGState createState() => PhoneAuthfromFGState();
}

class PhoneAuthfromFGState extends State<PhoneAuthfromFG> {
  bool loginLoading = false;
  String codeno;
  String phoneNo;
  String pageInfo;
  //static GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final phoneAuthformKey = new GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold");
  TextStyle styleGrey=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "header","none","nobold");
  TextStyle styleGreyNormal=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "normal","none","nobold");

  @override
  void initState() {
    phoneController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xffFFFFFF),
              appBar: AppBar(
                leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                  Navigator.pop(context);
                },),
                backgroundColor: Colors.green,
                title: Text(AppLocalizations.of(context).translate("phoneauth"),
                    style: styleWhite),
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
                          key: phoneAuthformKey,
                          child: ShowList(),
                        ),
                      ),
              ),
            ),
          ));
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
      child: Text(AppLocalizations.of(context).translate("entermobile"),
        textAlign: TextAlign.center,
        style: styleGrey
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
            return AppLocalizations.of(context).translate("entermobile1");
          }
          if (value.length < 6) {
            return AppLocalizations.of(context).translate("errmobile");
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone, color: Colors.green),
            prefixText: '09  ',
           // prefixStyle: styleGrey,
            hintText: AppLocalizations.of(context).translate("username"),
            hintStyle: styleGreyNormal,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
        // onChanged: (value) {
        //   //this.phoneNo = '+959'+value;
        // },
        //onSaved: phoneSubmit(),
        //onFieldSubmitted: phoneSubmit(),
        //onSubmitted: phoneSubmit(),
      ),
    );
  }

  phoneSubmit(){
    if (phoneAuthformKey.currentState.validate()) {
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
                pageInfo="FWG";
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SMSVerifyMtq(this.codeno,this.pageInfo,this.phoneNo),
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
            phoneController.clear();
          }
  }

  ///For Next Buttom
  Widget NextButtom() {
    return Container(
      child: RaisedButton(
        color: Color(0xff4AB055),
        onPressed: () =>phoneSubmit(),
        child: Text(AppLocalizations.of(context).translate("next"),
          style: styleWhite,
        ),
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
