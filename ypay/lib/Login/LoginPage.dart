import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/Providers/appLanguage.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/dataService/loginPresenter.dart';
import 'package:ypay/designUI/EyeIcon.dart';
import 'package:ypay/Login/CreateAcc.dart';
import 'package:ypay/Login/ForgetPassword.dart';
import 'package:ypay/designUI/MessageHandel.dart';
import 'package:ypay/model/Languages.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget{
  LoginPageState createState()=>LoginPageState();
}

class LoginPageState extends State<LoginPage> with LoginContract{

  bool loginLoading=false;
  final formKey=new GlobalKey<FormState>();
  final _userIdentity=new TextEditingController();
  final _password=new TextEditingController();
  bool _obscureText = true;
  LoginPresenter _presenter;
  String rdnLanguage;
  static Locale styleLocale;

  List<Languages> lgnList=[
    Languages(flag: Image.asset('icons/flags/png/mm.png', package: 'country_icons'), name:"MM - Burmese"),
    Languages(flag:Image.asset('icons/flags/png/cn.png', package: 'country_icons'),name: "CN - Chinese"),
    Languages(flag:Image.asset('icons/flags/png/us.png', package: 'country_icons'),name: "EN - English"),
  ];

  @override
  void initState() {
    getLocale();
    _presenter=new LoginPresenter(this, context);
    super.initState();
  }

  getLocale() async{
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      UserInfo.currentLocale=styleLocale=prefs.getString("language_code")==null?Locale('en'):Locale(prefs.getString("language_code"));
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    final navigatorKey = GlobalKey<NavigatorState>();
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    ScreenUtil().setSp(30);
    Languages languages;

    void popupChange(Languages newlng){
      setState(() {
        languages=newlng;
        appLanguage.changeLanguage(
          languages.name=='MM - Burmese'?new Locale('mm'):
          (languages.name=='CN - Chinese'?new Locale('zh'):new Locale('en')));
        print(languages.name);
        Phoenix.rebirth(context);
      });
    }

    Languages getInitialLanguage(){
      Languages languages=new Languages();
      if(styleLocale==Locale('mm')){
        languages=lgnList[0];
      }
      if(styleLocale==Locale('zh')){
        languages=lgnList[1];
      }
      if(styleLocale==Locale('en')){
        languages=lgnList[2];
      }
      return languages;
    }

    Widget img=Padding(
      padding: EdgeInsets.all(13),
    child:  
    styleLocale==Locale('zh')?
    Image.asset('images/chinaRound.png',):
    (styleLocale==Locale('mm')?Image.asset('images/mmRound.png'):Image.asset('images/usaRound.png'))
    );


    return MaterialApp(
      navigatorKey: navigatorKey,
       home:styleLocale==null?CircularProgressIndicator():
        SafeArea(
          child: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
             PopupMenuButton(
                  //icon: Icon(Icons.language,color: Colors.green,),
                  child: img,
                   initialValue: getInitialLanguage(),
                   itemBuilder: (BuildContext context){
                     return lgnList.map((Languages lng){
                       return PopupMenuItem(
                         value: lng,
                         child: Row(children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.only(right:5),
                             child: Container(
                               width: ScreenUtil().setWidth(100),
                               height: ScreenUtil().setHeight(100),
                               child: lng.flag),
                           ),
                           Text(lng.name,style: TextStylePage.getStyle(styleLocale,"black", "normal","none","nobold"),)
                         ],),
                       );
                     }).toList();
                   },
                   onSelected: (Languages newlng){
                     popupChange(newlng);
                   },
                 ),
          ],),
          body: Center(
            child:
            loginLoading==true?
            SpinKitRotatingCircle(
              color: Colors.green,
              size: 50.0,
            ):
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:10.0),
              child: Form(
                key: formKey,
                child: ShowList(),
              ),
            ),
          ),
      ),
        )
    );
  }

  Widget ShowList(){
    return ListView(
      children: <Widget>[
        SizedBox(height: 10.0,),
        Text(AppLocalizations.of(context).translate("welcome"),textAlign: TextAlign.center,
          style: TextStylePage.getStyle( styleLocale,"green", "header","none","nobold"),
          ),
        SizedBox(height: 10.0,),
        Image(image: AssetImage('images/bulb.jpg'),
          height: ScreenUtil().setHeight(220),),
        SizedBox(height: ScreenUtil().setHeight(20),),
        UserName(),
        SizedBox(height: ScreenUtil().setHeight(20),),
        Password(),
        SizedBox(height: ScreenUtil().setHeight(40),),
        LoginButton(),
        SizedBox(height: ScreenUtil().setHeight(20),),
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
            hintStyle: TextStylePage.getStyle(styleLocale,"grey", "normal","none","nobold"),
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
            hintStyle: TextStylePage.getStyle(styleLocale,"grey", "normal","none","nobold"),
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
        child: Text(AppLocalizations.of(context).translate("login"),style: TextStylePage.getStyle(styleLocale,"white", "normal","none","nobold"),),
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
                style:TextStylePage.getStyle(styleLocale,"black", "normal","none","nobold"),
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ForgetPassword(),)
              );
            },
          ),
          Text('|',style: TextStylePage.getStyle(styleLocale,"black", "normal","none","nobold"),),
          FlatButton(
            child: Text(
              AppLocalizations.of(context).translate("createbtn"),
              style: TextStylePage.getStyle(styleLocale,"black", "normal","none","nobold"),
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
              style: TextStylePage.getStyle(styleLocale,"black", "normal","none","nobold"),
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
          GestureDetector(
              onTap: (){
                setState(() {
                  loginLoading=true;
                });
                _presenter.loginWithFacebook();
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
                  height:ScreenUtil().setHeight(50) ,),
              )
          ),
          GestureDetector(
              onTap: (){
                
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
                  height:ScreenUtil().setHeight(40)  ,),
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
                  height:ScreenUtil().setHeight(40)  ,),
              )
          )
        ],
      ),
    );
  }

  @override
  void loginSuccess(UserInfo data) {
    if(data!=null){
      UserInfo.userInfo=data;
      setState(() {
        loginLoading=false;
      });
      Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => BottomTabBar()));
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
  }
}

