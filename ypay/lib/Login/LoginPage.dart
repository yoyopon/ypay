import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ypay/designUI/EyeIcon.dart';
import 'package:ypay/Login/CreateAcc.dart';
import 'package:ypay/Login/ForgetPassword.dart';
import 'package:ypay/Login/PhoneAuthfromF&G.dart';
import 'package:ypay/Page/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  final _userIdentity = new TextEditingController();
  final _password = new TextEditingController();
  bool _obscureText = true;
  TextStyle styles =
      TextStyle(color: Colors.grey, fontFamily: "EucrosiaUPC", fontSize: 25.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
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

  Widget ShowList() {
    return ListView(
      children: <Widget>[
        //SizedBox(height: 20.0,),
        Text(
          'Welcome YPay',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff4AB055),
              fontFamily: "EucrosiaUPC",
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Image(
          image: AssetImage('images/bulb.jpg'),
          height: 120,
        ),
        SizedBox(
          height: 20.0,
        ),
        UserName(),
        SizedBox(
          height: 20.0,
        ),
        Password(),
        SizedBox(
          height: 30.0,
        ),
        LoginButton(),
        SizedBox(
          height: 20.0,
        ),
        NextLinksText(),
        OrDivider(),
        OpenWithButton()
      ],
    );
  }

  ///For UserName TextBox
  Widget UserName() {
    return Container(
      child: TextFormField(
        controller: _userIdentity,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: Colors.green),
            hintText: "Phone Number / Email Address",
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Roboto Slab Regular"),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
        validator: (value) {
          if (value.isEmpty) {
            return 'Field must be filled';
          }
          String pattern =
              r'^(([0][9][2]{1}[5-6]{1}[0-9]{7})|([0][9][5]{1}[0-9]{6})|([0][9][4]{1}[0-9]{8})|([0][9][3]{1}[0-9]{7})|([0][9][7]{1}[6-9]{1}[0-9]{7})|([0][9][9]{1}[5-8]{1}[0-9]{7})|([0][9][6]{1}[5-9]{1}[0-9]{7})|([0][9][8]{1}[0-9]{8})|(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})))$';
          RegExp regex = new RegExp(pattern);
          if (!regex.hasMatch(value))
            return 'Enter Valid Phone Number or Email Address';
          else
            return null;
        },
      ),
    );
  }

  void _toggle() {
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
              onPressed: _toggle,
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

  ///For Login Buttom
  Widget LoginButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: 40.0,
      child: RaisedButton(
        onPressed: () async {
          if (_userIdentity.text == "yinyinmon696@gmail.com" &&
              _password.text == "123456") {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            showDialog(
              builder: (context) => AlertDialog(
                title: Text(
                  'Enter Valid UserName and Password',
                  style: TextStyle(fontFamily: "EucrosiaUPC", fontSize: 35),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _userIdentity.text = "";
                      _password.text = "";
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Color(0xff015287),
                          fontFamily: "EucrosiaUPC",
                          fontSize: 25),
                    ),
                  )
                ],
              ),
              context: context,
            );
          }
        },
        color: Color(0xff4AB055),
        child: Text(
          "Log In",
          style: TextStyle(
              color: Colors.white, fontFamily: "EucrosiaUPC", fontSize: 25),
        ),
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(32.0),
            side: BorderSide(color: Color(0xff4AB055))),
      ),
    );
  }

  ///For Forget Password Link @ Create New Account
  Widget NextLinksText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('Forget Password?',
                style: TextStyle(
                  color: Colors.black45,
                  fontFamily: "EucrosiaUPC",
                  fontSize: 22,
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPassword(),
                  ));
            },
          ),
          Text(
            '|',
            style: TextStyle(
                color: Colors.black45, fontFamily: "EucrosiaUPC", fontSize: 35),
          ),
          FlatButton(
            child: Text(
              'Create Account',
              style: TextStyle(
                color: Colors.black45,
                fontFamily: "EucrosiaUPC",
                fontSize: 22,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateAcc()));
            },
          ),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }

  ///For 'OR' Text Divider
  Widget OrDivider() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                  color: Colors.grey, fontFamily: "EucrosiaUPC", fontSize: 20),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  ///For Open With FaceBook & Google & WeChat
  Widget OpenWithButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.all(40.0),
//        ),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PhoneAuthfromFG()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Color(
                      0xff4AB055,
                    ),
                  ),
                ),
                child: Image(
                  image: AssetImage('images/faces.jpg'),
                  height: 38,
                ),
              )),
          GestureDetector(
              onTap: () {
                //Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhoneAuthfromFG()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Color(
                      0xff4AB055,
                    ),
                  ),
                ),
                child: Image(
                  image: AssetImage('images/wechat.png'),
                  height: 29,
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PhoneAuthfromFG()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Color(
                      0xff4AB055,
                    ),
                  ),
                ),
                child: Image(
                  image: AssetImage('images/google.jpg'),
                  height: 30,
                ),
              ))
        ],
      ),
    );
  }
}
