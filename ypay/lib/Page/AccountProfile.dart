import 'package:flutter/material.dart';
import 'package:ypay/designUI/MessageHandel.dart';
import 'package:ypay/Login/LoginPage.dart';
import 'package:ypay/dataService/userProfilePresenter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with UserProfileContract{
  UserProfilePresenter _presenter;
  @override
  void initState() {
    _presenter=new UserProfilePresenter(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    TextStyle style1=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal");
    return SafeArea(
        child: MaterialApp(
          home: Scaffold(
          //appBar: AppBar(title: Text("User Profile"),backgroundColor: Colors.green,),
          body: Column(
              children: <Widget>[

              Container(
                color: Colors.cyan,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20,bottom: 25),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: UserInfo.userInfo.imageUrl==""?AssetImage('images/bulb.jpg'):NetworkImage(UserInfo.userInfo.imageUrl),
                              width: ScreenUtil().setWidth(250),height:ScreenUtil().setHeight(250),),),
                          Padding(padding: EdgeInsets.only(left:20.0),),
                          Container(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                              Text(UserInfo.userInfo.name,style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "header"),),
                              SizedBox(height: ScreenUtil().setHeight(20.0),),
                              Text("Member Level : "+"Standard",style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal"),),
                              SizedBox(height: ScreenUtil().setHeight(10.0),),
                              Text("My growth : "+"1860",style: style1)
                            ],),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10,left: 20,bottom: 15,right: 20),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:10,right:10),
                            child: Column(children: <Widget>[
                              Text("Balance",style: style1),Text("000",style: style1)
                            ],),
                          ),
                          Container(height: ScreenUtil().setHeight(70.0), child: VerticalDivider(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(left:10,right:10),
                            child: Column(children: <Widget>[
                              Text("Point",style: style1),Text("000",style: style1)
                            ],),
                          ),
                          Container(height: ScreenUtil().setHeight(70.0), child: VerticalDivider(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(left:10,right:10),
                            child: Column(children: <Widget>[
                              Text("Order",style: style1),Text("000",style: style1)
                            ],),
                          ),
                          Container(height: ScreenUtil().setHeight(70.0), child: VerticalDivider(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(left:10,right:10),
                            child: Column(children: <Widget>[
                              Text("Message",style: style1),Text("000",style: style1)
                            ],),
                          )
                        ],),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                
              ),
            ],
          ),
      ),
        ),
    );
  }

  @override
  void logOutSuccess() {
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  @override
  void showError(String msg) {
    MessageHandel.showError(context, "", msg);
  }

  @override
  void showMessage() {
    // TODO: implement showMessage
  }

}