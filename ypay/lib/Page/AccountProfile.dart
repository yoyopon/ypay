import 'package:flutter/material.dart';
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
  @override
  void initState() {
    _presenter=new UserProfilePresenter(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    TextStyle style1=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold");
    return SafeArea(
        child: MaterialApp(
          home: Scaffold(
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
                                image: UserInfo.userInfo.imageUrl==""?AssetImage('images/bulb.jpg'):NetworkImage(UserInfo.userInfo.imageUrl),
                                width: ScreenUtil().setWidth(250),height:ScreenUtil().setHeight(250),),),
                            Padding(padding: EdgeInsets.only(left:20.0),),
                            Container(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                Text(UserInfo.userInfo.name,style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "header","none","nobold"),),
                                SizedBox(height: ScreenUtil().setHeight(20.0),),
                                Text("Member Level : "+"Standard",style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold"),),
                                SizedBox(height: ScreenUtil().setHeight(10.0),),
                                Text("My growth : "+"1860",style: style1)
                              ],),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.orange[500],
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
                                Text(" Point ",style: style1),Text("000",style: style1)
                              ],),
                            ),
                            Container(height: ScreenUtil().setHeight(70.0), child: VerticalDivider(color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.only(left:10,right:10),
                              child: Column(children: <Widget>[
                                Text(" Order ",style: style1),Text("000",style: style1)
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
                  child: Padding(padding: EdgeInsets.only(left:10,right: 10,top: 5),
                  child: Column(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(5.0)),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:0,bottom:0,left:10),
                          child: Row(
                            children: <Widget>[
                              Text("Manage Order",style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
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
                              Text("Close Order",style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
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
                              Text("Balance",style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
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
                              Text("Point",style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
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
                              Text("Message",style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
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
                              Text("My Profile",style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
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
                              Text(UserInfo.userInfo.loginWith=="google"||UserInfo.userInfo.loginWith=="facebook"?
                                "Edit PhoneNumber":"Change Password",
                                style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
                              Expanded(child: SizedBox(width: ScreenUtil().setWidth(50),)),
                              IconButton(icon:Icon(Icons.keyboard_arrow_right),onPressed: (){},)
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
                              Text("Logout",style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold")),
                              Expanded(child: SizedBox(width: ScreenUtil().setWidth(50),)),
                              IconButton(icon:Icon(Icons.exit_to_app),onPressed: (){},)
                            ],
                          ),
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text("Are you sure you want to log out?"),
                                    actions: <Widget>[
                                      FlatButton(child: Text("OK"),onPressed: (){
                                        Navigator.of(context).pop();
                                        logout();
                                      },),
                                      FlatButton(child: Text("Cancel"),onPressed: (){
                                        Navigator.of(context).pop();
                                      })
                                    ],
                                  );
                                }
                              );
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

  void logout(){
    if(UserInfo.userInfo.loginWith=="google"){
      _presenter.signOutFromGoogle();
    }
    if(UserInfo.userInfo.loginWith=="facebook"){
      _presenter.signOutFromFacebook();
    }
  }

  @override
  void logOutSuccess() {
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => MyApp()));
  }

  @override
  void showError(String msg) {
    Navigator.of(context).pop();
    MessageHandel.showError(context, "", msg);
  }

  @override
  void showMessage() {
  }

}