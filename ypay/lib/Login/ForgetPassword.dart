
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ypay/Login/LoginPage.dart';
import 'package:ypay/Login/ResetPassword.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';

class ForgetPassword extends StatefulWidget{
  ForgetPasswordState createState()=>ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword>{

  final formKey=new GlobalKey<FormState>();
  final _userIdentity=new TextEditingController();
  TextStyle styleWhite=TextStylePage.getStyle(LoginPageState.styleLocale,"white", "normal","none","nobold");
  TextStyle styleGrey=TextStylePage.getStyle(LoginPageState.styleLocale,"grey", "header","none","nobold");
  TextStyle styleGreyNormal=TextStylePage.getStyle(LoginPageState.styleLocale,"grey", "normal","none","nobold");
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor:Colors.green ,
          title:  Text(AppLocalizations.of(context).translate("find"),style: styleWhite
          ),
        ),
        body: Center(
          child:Padding(
            padding: const EdgeInsets.all(30.0),
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
Widget ShowList(){
  return ListView(
    children: <Widget>[
      HeaderText(),
      SizedBox(height: 30.0),
      UserName(),
      SizedBox(height: 50.0),
      NextButtom(),
    ],
  );
}

///For Header Text
Widget HeaderText(){
  return Container(
    child:  Text(AppLocalizations.of(context).translate("pleaseenter"),
      textAlign: TextAlign.center,
      style: styleGrey),

  );
}

///For Email Address or Phone Number TextBox
  Widget UserName(){
    return Container(
      child: TextFormField(
        controller: _userIdentity,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box,color: Colors.green),
            hintText: AppLocalizations.of(context).translate("username"),
            hintStyle: styleGreyNormal,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            )
        ),
        validator: (value){
          if(value.isEmpty){
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

  ///For Next Buttom
  Widget NextButtom(){
    return Container(
      child: RaisedButton(
        color: Color(0xff4AB055),
        onPressed: (){
            Navigator.push(context, MaterialPageRoute
              (builder: (context)=>ResetPassword()));
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
        child: Text(AppLocalizations.of(context).translate("confirm"),
          style: styleWhite),
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ) ,
    );
  }
}