import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/designUI/EyeIcon.dart';
import 'package:ypay/Login/PhoneAuthfromF&G.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _currentpw = new TextEditingController();
  TextEditingController _newpw = new TextEditingController();
  TextEditingController _conpw = new TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Change Password',
              style: TextStyle(
                  color: Colors.white, fontFamily: "myanmar3", fontSize: 20)),
        ),
        body: showList(),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  ///For Page List
  showList() => Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              currentpw(),
              SizedBox(height: 10.0),
              newpw(),
              SizedBox(height: 10.0),
              confirmnewpw(),
              SizedBox(height: 50.0),
              saveChanges(),
              SizedBox(height: 20.0),
              cancel(),
              SizedBox(height: 20.0),
              forgetpw()
            ],
          ),
        ),
      );

  currentpw() => Container(
        child: TextFormField(
          controller: _currentpw,
          obscureText: _obscureText,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
              hintText: 'Current Password',
              hintStyle: TextStyle(fontFamily: "Roboto Slab Regular"),
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
  newpw() => Container(
        child: TextFormField(
          controller: _newpw,
          obscureText: _obscureText1,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
              hintText: 'New Password',
              hintStyle: TextStyle(fontFamily: "Roboto Slab Regular"),
              suffixIcon: IconButton(
                onPressed: _toggle1,
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
  confirmnewpw() => Container(
        child: TextFormField(
          controller: _conpw,
          obscureText: _obscureText2,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
              hintText: 'Confirm New Password',
              hintStyle: TextStyle(fontFamily: "Roboto Slab Regular"),
              suffixIcon: IconButton(
                onPressed: _toggle2,
                icon: _obscureText2
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

  saveChanges() => Container(
        child: RaisedButton(
          color: Color(0xff4AB055),
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomTabBar(),
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
            'Save Changes',
            style: TextStyle(
                fontSize: 30, fontFamily: 'EucrosiaUPC', color: Colors.white),
          ),
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      );

  ///For Cancel Buttom
  cancel() => Container(
        child: RaisedButton(
          color: Color(0xff4AB055),
          onPressed: () {
            Navigator.pop(context);

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
            'Cancel',
            style: TextStyle(
                fontSize: 30, fontFamily: 'EucrosiaUPC', color: Colors.white),
          ),
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      );

  forgetpw() => Container(
        child: Center(
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhoneAuthfromFG()));
              },
              child: Text(
                'Forget Password?',
                style: TextStyle(
                    fontFamily: "Roboto Slab Regular",
                    fontSize: 15.0,
                    color: Colors.black54),
              )),
        ),
      );
}
