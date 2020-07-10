import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:ypay/Login_AbstractClass/LoginStoreImplement.dart';

class OtpPage extends StatefulWidget{

  const OtpPage({Key key}) : super(key: key);

  @override
  OtpPageState createState()=>OtpPageState();
}

class OtpPageState extends State<OtpPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor:Colors.green ,
          title:  Text("Verification Code Sent",style: TextStyle(color:Colors.white,fontFamily: "EucrosiaUPC",fontSize: 30)
          ),
        ),
        body: Center(
          child:Padding(
            padding: const EdgeInsets.all(30.0),
              child: ShowList(),
          ),
        ),
      ),
    );
  }

  Widget ShowList(){
    return ListView(
      children: <Widget>[
        VerifyText(),
        SizedBox(height: 20.0,),
        CodeBox(),
        SizedBox(height: 20.0,),
        ConfirmButtom(),
        SizedBox(height: 30.0,),
        KeyBoard(),
        SizedBox(height: 20.0,),

      ],
    );
  }

  ///For Mobile Text
  Widget VerifyText()
  {
    return Container(
      child:  Text('Enter 6 digits verification code sent to your phone number',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 30,
          fontFamily: 'EucrosiaUPC',
        ),),

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
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Center(child: Text(text[position], style: TextStyle(color: Colors.black),)),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      );
    }
  }

  /// For Code Multiple Box
  Widget CodeBox(){
    return Container(
          constraints: const BoxConstraints(
          maxWidth: 500
          ),
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
Widget ConfirmButtom(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      constraints: const BoxConstraints(
          maxWidth: 500
      ),
      child: RaisedButton(
        onPressed: () {
          LoginStore loginStore=new LoginStore();
          loginStore.validateOtpAndLogin(context, text);
        },
        color: Colors.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Confirm', style: TextStyle(color: Colors.white,fontFamily: 'EucrosiaUPC',fontSize: 28.0),),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.green,
                ),
                child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
              )
            ],
          ),
        ),
      ),
    );
}

///For KeyBoard
Widget KeyBoard(){
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

}