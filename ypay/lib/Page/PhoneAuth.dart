import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ypay/Page/CreateAcc.dart';
import 'package:ypay/Page/userProfile.dart';
//import 'package:ypay/LoginSuccess.dart';

class PhoneAuth extends StatefulWidget{
  PhoneAuthState createState()=>PhoneAuthState();
}

class PhoneAuthState extends State<PhoneAuth>{

  final formKey=new GlobalKey<FormState>();
  //final phoneNo=new TextEditingController();
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor:Colors.green ,
          title:  Text("Phone Authentication",style: TextStyle(color:Colors.white,fontFamily: "EucrosiaUPC",fontSize: 30)
          ),
        ),
        body: Center(
          child:Padding(
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
Widget ShowList()
{
  return ListView(
    children: <Widget>[
      MobileText(),
      SizedBox(height: 30.0),
      PhoneNumber(),
      (errorMessage != ''
          ? Text(
        errorMessage,
        style: TextStyle(color: Colors.red),
      )
          : Container()),
      SizedBox(height: 50.0),
      NextButtom(),
    ],
  );
}

///For Mobile Text
Widget MobileText()
{
  return Container(
    child:  Text('Enter Mobile Number to confirm your account',
      textAlign: TextAlign.center,
      style: TextStyle(
      color: Colors.black54,
      fontSize: 30,
      fontFamily: 'EucrosiaUPC',
      ),),

  );
}

///For Phone Number TextBox
  Widget PhoneNumber(){
    return Container(
      child: TextField(
        //controller: phoneNo,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone,color: Colors.green),
            prefixText: "09  ",
            hintText: "Phone Number",
            hintStyle: TextStyle(color: Colors.grey ,fontFamily: "Roboto Slab Regular"),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            )
        ),
        onChanged: (value) {
          this.phoneNo = "+959"+value;
        },
      ),
    );
  }

  ///For Next Buttom
  Widget NextButtom(){
    return Container(
      child: RaisedButton(
        color: Color(0xff4AB055),
        onPressed: (){
          verifyPhone();
          //Navigator.pop(context);
//          Navigator.pushReplacement(
//              context,
//              MaterialPageRoute(builder: (context)=>PhoneAuth(),));
//          if(_formkey.currentState.validate()){
//            //rest-api section
//            APIService.userByUserId(_userIdentity.text).then((success){
//              if(success!=null){
//                showDialog(
//                  builder: (context) => AlertDialog(
//                    title: Text('User Id is already existed!!Try using another phone number or email'),
//                    actions: <Widget>[
//                      FlatButton(
//                        onPressed:() {
//                          Navigator.pop(context);
//                          Navigator.pop(context);
//                        },
//                        child: Text('OK'),
//                      )
//                    ],
//                  ),
//                  context: context,
//                );
//              }
//              else{
//                final body={
//                  "UserIdentity": _userIdentity.text,
//                  "UserFullName" :_userFullName.text,
//                  "Password":_pass.text,
//                  "ConPassword":_conpass.text,
//                };
//                String userId=_userIdentity.text;
//                APIService.addEmployee(body).then((success){
//                  if(success){
//                    showDialog(
//                      builder:(context)=> AlertDialog(
//                        title: Text('Successfully Registered'),
//                        actions: <Widget>[
//                          FlatButton(
//                            onPressed: (){
//                              Navigator.pop(context);
//                              Navigator.pop(context);
//                              Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyCode(userId,"create")));
//                              _userIdentity.text='';
//                              _userFullName.text='';
//                              _pass.text='';
//                              _conpass.text='';
//                            },
//                            child: Text('OK'),
//                          )
//                        ],
//                      ),
//                      context: context,
//                    );
//                    return;
//
//                  }
//                  else{
//                    showDialog(
//                      builder: (context) => AlertDialog(
//                        title: Text('Error Registering New User!!!'),
//                        actions: <Widget>[
//                          FlatButton(
//                            onPressed:() {
//                              Navigator.pop(context);
//                              Navigator.pop(context);
//                            },
//                            child: Text('OK'),
//                          )
//                        ],
//                      ),
//                      context: context,
//                    );
//                    return;
//                  }
//                });
//
//              }//test user id
//            });
//            showDialog(builder: (context)=>AlertDialog(
//              backgroundColor: Colors.transparent,
//              content: Container(
//                  height: 200.0,
//                  width: 400.0,
//                  child: Center(
//                    child: LoadingProgress(),)
//              ),
//            ),
//              context: context,
//            );
//          }
        },
        child: Text('Confirm',
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'EucrosiaUPC',
              color: Colors.white
          ),),
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ) ,
    );
  }

  ///OTP Authentication Using Firebase
  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      }
      );
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }

  Future<bool>  smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter SMS Code'),
            content: Container(
              height: 85,
              child: Column(children: [
                TextField(
                  onChanged: (value) {
                    this.smsOTP = value;
                  },
                ),
                (errorMessage != ''
                    ? Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  _auth.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAcc()));
                      //Navigator.of(context).pushReplacementNamed('/homepage');
                    } else {
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSuccess()));
    } catch (e) {
      handleError(e);
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        //Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          print('sign in');
        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }

}