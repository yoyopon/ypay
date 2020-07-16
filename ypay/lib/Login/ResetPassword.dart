import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ypay/Login/LoginPage.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/Providers/appLanguage.dart';
import 'package:ypay/designUI/EyeIcon.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class ChangePassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage(),
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          supportedLocales: [
              Locale('en', 'US'),
              Locale('mm', 'MM'),
              Locale('zh', 'CN'),

            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            home: ResetPassword(),
        );
      }),
    );
  }
  
}

class ResetPassword extends StatefulWidget{
  ResetPasswordState createState()=>ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword>{

  final formKey=new GlobalKey<FormState>();
  final _password=new TextEditingController();
  final _conpassword=new TextEditingController();
  bool _obscureText=true;
  bool _obscureText1=true;
  TextStyle styleWhite=TextStylePage.getStyle(LoginPageState.styleLocale,"white", "normal","none","nobold");
  TextStyle styleGrey=TextStylePage.getStyle(LoginPageState.styleLocale,"grey", "normal","none","nobold");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                  UserInfo.prev=="info"?
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomTabBar())):
                  Navigator.pop(context);
                },),
            backgroundColor:Colors.green ,
            title:  Text(AppLocalizations.of(context).translate("resetpass"),style: styleWhite),
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
      ),
    );
  }

  ///For ShowList
  Widget ShowList()
  {
    return ListView(
      children: <Widget>[
        MobileText(),
        SizedBox(height: 20.0),
        Password(),
        SizedBox(height: 20.0),
        ConPassword(),
        SizedBox(height: 50.0),
        ConfirmButtom(),
      ],
    );
  }

  ///For Text
  Widget MobileText()
  {
    return Container(
      child:  Text(AppLocalizations.of(context).translate("pleaseenter1"),
        textAlign: TextAlign.center,
        style: styleGrey),

    );
  }

  ///for toggle
  void toggle(){
    setState(() {
      _obscureText=!_obscureText;

    });
  }

  ///For Password TextBox
  Widget Password(){
    return Container(
      child: TextFormField(
        controller: _password,
        obscureText: _obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key,color: Colors.green),
            hintText: AppLocalizations.of(context).translate("pass"),
            hintStyle: styleGrey,
            suffixIcon: IconButton(
              onPressed: toggle,
              icon: _obscureText?Icon(MyFlutterApp.eye_slash_solid,size: 17,color: Colors.green):Icon(Icons.remove_red_eye,size: 20,color: Colors.green),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            )
        ),
        validator: (value){
          if(value.length < 6){
            return 'Password must be at least 6 characters';
          }
          if(value.isEmpty){
            return 'Password must be filled';
          }
        },
      ),
    );
  }

  ///for toggle
  void toggle1(){
    setState(() {
      _obscureText1=!_obscureText1;

    });
  }

  ///For ConfirmPassword TextBox
  Widget ConPassword(){
    return Container(
      child: TextFormField(
        controller: _conpassword,
        obscureText: _obscureText1,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key,color: Colors.green),
            hintText: AppLocalizations.of(context).translate("confirmPass"),
            hintStyle: styleGrey,
            suffixIcon: IconButton(
              onPressed: toggle1,
              icon: _obscureText1?Icon(MyFlutterApp.eye_slash_solid,size: 17,color: Colors.green):Icon(Icons.remove_red_eye,size: 20,color: Colors.green),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            )
        ),
        validator: (value){
          if(value.length < 6){
            return 'Password must be at least 6 characters';
          }
          if(value.isEmpty){
            return 'Password must be filled';
          }
        },
      ),
    );
  }

  ///For Confirm Buttom
  Widget ConfirmButtom(){
    return Container(
      child: RaisedButton(
        color: Color(0xff4AB055),
        onPressed: (){
          //Navigator.pop(context);
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