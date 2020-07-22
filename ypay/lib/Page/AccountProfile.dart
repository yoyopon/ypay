import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ypay/Login/PhoneAuthfromF&G.dart';
import 'package:ypay/Login/ResetPassword.dart';
import 'package:ypay/Page/Message.dart';
import 'package:ypay/Page/MyProfile.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/MessageHandel.dart';
import 'package:ypay/dataService/userProfilePresenter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

import '../designUI/TextStyle.dart';
import '../main.dart';
import '../model/userInfo.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with UserProfileContract{
  Widget orangeSection;Widget firstBlock;Widget secondBlock;Widget thirdBlock;
  UserProfilePresenter _presenter;
  TextStyle style1=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold");
  bool loadingLogOut=false;

  @override
  void initState() {
    _presenter=new UserProfilePresenter(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    return SafeArea(
        child: MaterialApp(
          home:loadingLogOut==true?
          SpinKitChasingDots(
              color: Colors.blue[400],
              size: 50.0,
            ):
          Scaffold(
          body: SingleChildScrollView(
               child: Column(
                children: <Widget>[

                Container(
                  color: Colors.blue[400],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 20,bottom: 15),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Image(
                                image: UserInfo.userInfo.imageUrl==""||UserInfo.userInfo.imageUrl==null?AssetImage('images/bulb.jpg'):NetworkImage(UserInfo.userInfo.imageUrl),
                                width: ScreenUtil().setWidth(250),height:ScreenUtil().setHeight(250),),),
                            Padding(padding: EdgeInsets.only(left:20.0),),
                            Container(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                Text(UserInfo.userInfo.name,style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "header","none","nobold"),),
                                SizedBox(height: ScreenUtil().setHeight(20.0),),
                                Text(AppLocalizations.of(context).translate("member")
                                  +"Standard",style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold"),),
                                SizedBox(height: ScreenUtil().setHeight(10.0),),
                                Text(AppLocalizations.of(context).translate("growth")+":"+"1860",style: style1)
                              ],),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.orange[500],
                        child: Padding(
                          padding: EdgeInsets.only(top: 10,left: 10,bottom: 15,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10),
                                child: Container(
                                  //width: ScreenUtil().setWidth(150.0),
                                  child: Column(children: <Widget>[
                                    Text(AppLocalizations.of(context).translate("balance"),style: style1),Text("000",style: style1)
                                  ],),
                                ),
                              ),
                              Container(height: ScreenUtil().setHeight(70.0), child: VerticalDivider(color: Colors.white)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10),
                                child: Container(
                                  //width: ScreenUtil().setWidth(120.0),
                                  child: Column(children: <Widget>[
                                    Text(AppLocalizations.of(context).translate("point"),style: style1),Text("000",style: style1)
                                  ],),
                                ),
                              ),
                              Container(height: ScreenUtil().setHeight(70.0), child: VerticalDivider(color: Colors.white)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10),
                                child: Container(
                                  //width: ScreenUtil().setWidth(125.0),
                                  child: Column(children: <Widget>[
                                    Text(AppLocalizations.of(context).translate("order"),style: style1),Text("000",style: style1)
                                  ],),
                                ),
                              ),
                              Container(height: ScreenUtil().setHeight(70.0), child: VerticalDivider(color: Colors.white)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10),
                                child: Container(
                                 // width: ScreenUtil().setWidth(150.0),
                                  child: InkWell(
                                    child: Column(children: <Widget>[
                                      Text(AppLocalizations.of(context).translate("msg"),style: style1,),Text("000",style: style1)
                                    ],),
                                    onTap: (){
                                      UserInfo.prevFormsgPage="acc";
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MessagePage()));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(padding: EdgeInsets.only(left:10,right: 10,top: 5),
                  child: Column(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(5.0)),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:0,bottom:0,left:10),
                          child: Row(
                            children: <Widget>[
                              Text(AppLocalizations.of(context).translate("manage"),style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
                              Expanded(child: SizedBox(width: ScreenUtil().setWidth(50),)),
                              IconButton(icon:Icon(Icons.keyboard_arrow_right),onPressed: (){},)
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.only(top:0,bottom:0,left:10),
                          child: Row(
                            children: <Widget>[
                              Text(AppLocalizations.of(context).translate("close"),style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
                              Expanded(child: SizedBox(width: ScreenUtil().setWidth(50),)),
                              IconButton(icon:Icon(Icons.keyboard_arrow_right),onPressed: (){},)
                            ],
                          ),
                        )
                      ],),
                    )
                  ],),
                  ),
                ),
                Container(
                  child: Padding(padding: EdgeInsets.only(left:10,right: 10,top: 5),
                  child: Column(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(5.0)),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:0,bottom:0,left:10),
                          child: Row(
                            children: <Widget>[
                              Text(AppLocalizations.of(context).translate("myprofile"),style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
                              Expanded(child: SizedBox(width: ScreenUtil().setWidth(50),)),
                              IconButton(icon:Icon(Icons.keyboard_arrow_right),onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
                              },)
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.only(top:0,bottom:0,left:10),
                          child: Row(
                            children: <Widget>[
                              Text(UserInfo.userInfo.loginWith=="google"||UserInfo.userInfo.loginWith=="facebook"?
                                AppLocalizations.of(context).translate("editphone"):AppLocalizations.of(context).translate("changepass"),
                                style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
                              Expanded(child: SizedBox(width: ScreenUtil().setWidth(50),)),
                              IconButton(icon:Icon(Icons.keyboard_arrow_right),onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  UserInfo.userInfo.loginWith=="google"||UserInfo.userInfo.loginWith=="facebook"?
                                  PhoneAuthfromFG():ChangePassword()
                                  //MyApp()
                                ));
                              },)
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.only(top:0,bottom:0,left:10),
                          child: 
                          InkWell(
                            child: Row(
                            children: <Widget>[
                              Text(AppLocalizations.of(context).translate("logout"),style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
                              Expanded(child: SizedBox(width: ScreenUtil().setWidth(50),)),
                              IconButton(icon:Icon(Icons.exit_to_app),onPressed: (){},)
                            ],
                          ),
                            onTap: (){
                              print(UserInfo.currentLocale.toString());
                              setState(() {
                                
                              });
                              openAlertBox();
                            },
                          )
                        )
                      ],),
                    )
                  ],),
                  ),
                ),
              ],
            ),
          ),
      ),
        ),
    );


  }

  ///For Alert Dialog Box
  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.power_settings_new,
                        size: 70.0,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text(
                          AppLocalizations.of(context).translate("logoutalert"),
                          style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold"),)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.5),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            logout();
                          },
                          child: Text(
                            AppLocalizations.of(context).translate("logout"),
                            style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold")
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.5),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                             AppLocalizations.of(context).translate("cancel"),
                            style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void logout(){
    if(UserInfo.userInfo.loginWith=="google"){
      _presenter.signOutFromGoogle();
    }
    if(UserInfo.userInfo.loginWith=="facebook"){
      _presenter.signOutFromFacebook();
    }
    setState(() {
      loadingLogOut=true;
    });
  }

  @override
  void logOutSuccess() {
     _presenter.deleteFromDB();
  }

  @override
  void showError(String msg) {
    Navigator.of(context).pop();
    MessageHandel.showError(context, "", msg);
  }

  @override
  void showMessage() {
  }

  Future<void> gotoNextPage(){
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => MyApp()));
  }

  @override
  void deleteSuccess(){
   UserInfo.userInfo=null;
    UserInfo.currentLocale=null;
    gotoNextPage().then((success){
      setState(() {
        loadingLogOut=false;
      });
    });
  }


}