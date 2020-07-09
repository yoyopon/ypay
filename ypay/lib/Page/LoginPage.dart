import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ypay/Page/userProfile.dart';
import 'package:ypay/localization/appLanguage.dart';
import 'package:ypay/dataService/loginPresenter.dart';
import 'package:ypay/designUI/EyeIcon.dart';
import 'package:ypay/Page/CreateAcc.dart';
import 'package:ypay/Page/ForgetPassword.dart';
import 'package:ypay/designUI/MessageHandel.dart';
import 'package:ypay/localization/AppLocalization.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget{
  LoginPageState createState()=>LoginPageState();
}

class LoginPageState extends State<LoginPage> with LoginContract{

  bool loginLoading=false;
  final formKey=new GlobalKey<FormState>();
  final _userIdentity=new TextEditingController();
  final _password=new TextEditingController();
  bool _obscureText = true;
  TextStyle styles=TextStyle(color:Colors.grey,fontFamily: "EucrosiaUPC",fontSize: 25.0);
  LoginPresenter _presenter;
  String rdnLanguage;

  @override
  void initState() {
    _presenter=new LoginPresenter(this, context);
    super.initState();
  }

  int _groupValue=-1;
  Widget _myRadioButton({String title, int value, Function onChanged}) {
  return RadioListTile(
    value: value,
    groupValue: _groupValue,
    onChanged: onChanged,
    title: Text(title),
  );
}

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    final navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      navigatorKey: navigatorKey,
       home:
        Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(icon:Icon(Icons.language),color: Colors.green,
              onPressed: (){
                final context = navigatorKey.currentState.overlay.context;
                
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return AlertDialog(
                          title: Text("Choose Language"),
                          content: Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
                            _myRadioButton(
                                title: "Burmese",
                                value: 0,
                                onChanged: (newValue) {
                                  setState(() => _groupValue = newValue);
                                  Navigator.pop(context);
                                  appLanguage.changeLanguage(new Locale('mm')).then((success){
                                  });
                                }
                              ),
                            _myRadioButton(
                              title: "Chinese",
                              value: 1,
                              onChanged: (newValue) {
                                setState(() => _groupValue = newValue);
                                Navigator.pop(context);
                                appLanguage.changeLanguage(new Locale('zh'));
                              }
                            ),
                            _myRadioButton(
                              title: "English",
                              value: 2,
                              onChanged: (newValue) {
                                setState(() => _groupValue = newValue);
                                Navigator.pop(context);
                                appLanguage.changeLanguage(new Locale('en'));
                              }
                            ),
                          ],)
                        );
                      },
                    );
                  },
                );
              },
           )
        ],),
        body: Center(
          child:
          loginLoading==true?
          SpinKitRotatingCircle(
            color: Colors.green,
            size: 50.0,
          ):
          Padding(
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

  Widget ShowList(){
    return ListView(
      children: <Widget>[
        //SizedBox(height: 20.0,),
        Text(AppLocalizations.of(context).translate("welcome"),textAlign: TextAlign.center,
        //Text(DemoLocalization.of(context).getTranslatedValue("welcome"),textAlign: TextAlign.center,
          style: TextStyle(color:Color(0xff4AB055),
              fontFamily: "myanmar3",
              fontSize: 20,
              fontWeight:FontWeight.bold ),),
        SizedBox(height: 20.0,),
        Image(image: AssetImage('images/bulb.jpg'),
          height:120 ,),
        SizedBox(height: 20.0,),
        UserName(),
        SizedBox(height: 20.0,),
        Password(),
        SizedBox(height: 30.0,),
        LoginButton(),
        SizedBox(height: 20.0,),
        NextLinksText(),
        OrDivider(),
        OpenWithButton()
      ],
    );
  }

  ///For UserName TextBox
  Widget UserName(){
    return Container(
      child: TextFormField(
        controller: _userIdentity,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box,color: Colors.green),
            hintText: AppLocalizations.of(context).translate("username"),
            hintStyle: TextStyle(color: Colors.grey ,fontFamily: "myanmar3"),
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
            hintStyle: TextStyle(color: Colors.grey ,fontFamily: "myanmar3"),
            suffixIcon: IconButton(
              onPressed: _toggle,
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

  ///For Login Buttom
  Widget LoginButton(){
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: 40.0,
      child: RaisedButton(
        onPressed:() async {
          if(_userIdentity.text=="yinyinmon696@gmail.com"&&_password.text=="123456")
          {
            //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginSuccess()));

          }
          else
          {
            showDialog(
              builder: (context) => AlertDialog(
                title: Text('Enter Valid UserName and Password',
                  style: TextStyle(
                      fontFamily: "EucrosiaUPC",
                      fontSize: 35
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed:() {
                      _userIdentity.text="";
                      _password.text="";
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context)=>LoginPage(),));
                    },
                    child: Text('OK',
                      style: TextStyle(color:Color(0xff015287),fontFamily: "EucrosiaUPC",fontSize: 25),),
                  )
                ],
              ),
              context: context,
            );
          }

        },
        color: Color(0xff4AB055),
        child: Text(AppLocalizations.of(context).translate("login"),style: TextStyle(color: Colors.white,fontFamily: "myanmar3",fontSize: 15),),
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(32.0),
            side: BorderSide(color: Color(0xff4AB055))
        ),
      ),
    );
  }

  ///For Forget Password Link @ Create New Account
  Widget NextLinksText(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text(
                AppLocalizations.of(context).translate("forgetpass"),
                style:TextStyle(color: Colors.black45,fontFamily: "myanmar3",fontSize: 16,)
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ForgetPassword(),)
              );
            },
          ),
          Text('|',style: TextStyle(color: Colors.black45,fontFamily: "myanmar3",fontSize: 16),),
          FlatButton(
            child: Text(
              AppLocalizations.of(context).translate("createbtn"),
              style: TextStyle(color: Colors.black45,fontFamily: "myanmar3",fontSize: 16,),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAcc()));
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
              AppLocalizations.of(context).translate("or"),
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "myanmar3",
                  fontSize: 20
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  ///For Open With FaceBook & Google & WeChat
  Widget OpenWithButton()
  {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.all(40.0),
//        ),
          GestureDetector(
              onTap: (){
                _presenter.loginWithFacebook();
                setState(() {
                  loginLoading=true;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color:Color(0xff4AB055,
                    ),
                  ),
                ),
                child: Image(image: AssetImage('images/faces.jpg'),
                  height:38 ,),
              )
          ),
          GestureDetector(
              onTap: (){
                //Navigator.pop(context);
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginSuccess()));

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color:Color(0xff4AB055,
                    ),
                  ),
                ),
                child: Image(image: AssetImage('images/wechat.png'),
                  height:29 ,),
              )
          ),
          GestureDetector(
              onTap: (){
                _presenter.loginWithGoogleAcc();
                setState(() {
                  loginLoading=true;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color:Color(0xff4AB055,
                    ),
                  ),
                ),
                child: Image(image: AssetImage('images/google.jpg'),
                  height:30 ,),
              )
          )
        ],
      ),
    );
  }

  @override
  void loginSuccess(UserInfo data) {
    if(data!=null){
      setState(() {
        loginLoading=false;
      });
      Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => UserProfile(data)));
    }
  }

  @override
  void showError(String msg) {
    MessageHandel.showError(context, "", msg);
    setState(() {
        loginLoading=false;
      });
  }

  @override
  void showMessage() {
    // TODO: implement showMessage
  }
}

