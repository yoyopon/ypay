//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ypay/designUI/EyeIcon.dart';
import 'package:ypay/Login/AccConfirmWithPhno.dart';

class CreateAcc extends StatefulWidget {
  CreateAccState createState() => CreateAccState();
}

class CreateAccState extends State<CreateAcc> {
  final formKey = new GlobalKey<FormState>();
  final _fullname = new TextEditingController();
  final _password = new TextEditingController();
  final _conpassword = new TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;
  //final _fontstyle=TextStyle(color: Colors.green,fontFamily: "Roboto Slab Regular");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Create Your Account",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "EucrosiaUPC",
                  fontSize: 30)),
        ),
        body: Center(
          child: Padding(
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

  ///ShowList
  Widget ShowList() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 20.0),
        IconPerson(),
        SizedBox(height: 20.0),
        //CreateAccText(),
        SizedBox(height: 20.0),
        FullName(),
        SizedBox(height: 20.0),
        Password(),
        SizedBox(height: 20.0),
        ConPassword(),
        SizedBox(height: 50.0),
        ConfirmButtom(),
      ],
    );
  }

  ///For Header Icon
  Widget IconPerson() {
    return Container(
      child: Icon(
        Icons.account_circle,
        color: Colors.green,
        size: 100.0,
      ),
    );
  }

  ///For Create Account Text
  Widget CreateAccText() {
    return Container(
      child: Text(
        'Create New Account',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 40,
          fontFamily: 'EucrosiaUPC',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ///For FullName TextBox
  Widget FullName() {
    return Container(
      child: TextFormField(
        controller: _fullname,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: Colors.green),
            hintText: "FullName",
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Roboto Slab Regular"),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
      ),
    );
  }

  ///for toggle
  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  ///For Password TextBox
  Widget Password() {
    return Container(
      child: TextFormField(
        controller: _password,
        obscureText: _obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
            hintText: "Password",
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Roboto Slab Regular"),
            suffixIcon: IconButton(
              onPressed: toggle,
              icon: _obscureText
                  ? Icon(MyFlutterApp.eye_slash_solid,
                      size: 17, color: Colors.green)
                  : Icon(Icons.remove_red_eye, size: 20, color: Colors.green),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
        validator: (value) {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          if (value.isEmpty) {
            return 'Password must be filled';
          }
        },
      ),
    );
  }

  ///for toggle
  void toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  ///For ConfirmPassword TextBox
  Widget ConPassword() {
    return Container(
      child: TextFormField(
        controller: _conpassword,
        obscureText: _obscureText1,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
            hintText: "Confirm Password",
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Roboto Slab Regular"),
            suffixIcon: IconButton(
              onPressed: toggle1,
              icon: _obscureText1
                  ? Icon(MyFlutterApp.eye_slash_solid,
                      size: 17, color: Colors.green)
                  : Icon(Icons.remove_red_eye, size: 20, color: Colors.green),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
        validator: (value) {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          if (value.isEmpty) {
            return 'Password must be filled';
          }
        },
      ),
    );
  }

  ///For Confirm Buttom
  Widget ConfirmButtom() {
    return Container(
      child: RaisedButton(
        color: Color(0xff4AB055),
        onPressed: () {
          //Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhoneAuth(),
              ));
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
        child: Text(
          'Confirm',
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
}
