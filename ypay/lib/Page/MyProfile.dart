import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Color gradientStart = Colors.blue[400]; //Change start gradient color here
  Color gradientEnd = Colors.orange[500]; //Change end gradient color here
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold");
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.orange[500],
          title: Text(AppLocalizations.of(context).translate("myprofile"),
              style: styleWhite),
        ),
        body: Column(
          children: <Widget>[
            ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().setHeight(400),
                decoration: new BoxDecoration(
                  // gradient: new LinearGradient(
                  //     colors: [gradientStart, gradientEnd],
                  //     begin: const FractionalOffset(1, 0.0),
                  //     end: const FractionalOffset(0.0, 1),
                  //     stops: [0.0, 1.0],
                  //     tileMode: TileMode.clamp),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://thumbs.gfycat.com/FlawedAnimatedBlackfootedferret-size_restricted.gif'),
                      fit: BoxFit.fill),
                ),
                child: Center(
                    child: Stack(
                      alignment: const Alignment(0.5, 0.5),
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://image.winudf.com/v2/image/Y29tLnN1YWRhaDA2MTEuYW5pbWVnaXJsa2F3YWlpYXBwX3NjcmVlbl8yXzE1MjM4OTA0OTRfMDI0/screen-2.jpg?fakeurl=1&type=.jpg'),
                          radius: 70,
                        ),
                      ],
                    ),
                  )
              ),
              clipper: CustomClipPath(),
            ),
            //SizedBox(height: 20.0),
            //myprofile(),
            SizedBox(height: 30.0),
            userName(),
            horizonaldivider(),
            SizedBox(height: 20.0),
            email(),
            horizonaldivider(),
            SizedBox(height: 20.0),
            phonenumber(),
            horizonaldivider(),
          ],
        ),
      ),
    );
  }

  ///For Username Text
  userName() => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          width: ScreenUtil().setWidth(1000),
          height: ScreenUtil().setHeight(70),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.green,
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                  width: ScreenUtil().setWidth(200), child: Text(AppLocalizations.of(context).translate("fullName"),style: styleBlack,)),
              SizedBox(
                width: ScreenUtil().setWidth(50),
              ),
              Expanded(
                child: Text(UserInfo.userInfo.name),
              )
            ],
          ),
        ),
      );

  ///For Email Text
  email() => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          width: ScreenUtil().setWidth(1000),
          height: ScreenUtil().setHeight(70),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.mail,
                size: 30,
                color: Colors.green,
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                  width: ScreenUtil().setWidth(200),
                  child: Text(AppLocalizations.of(context).translate("email"),style: styleBlack,)),
              SizedBox(
                width: ScreenUtil().setWidth(50),
              ),
              Expanded(
                child: Text(UserInfo.userInfo.email),
              )
            ],
          ),
        ),
      );

  ///For Phone Number Text
  phonenumber() => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          width: ScreenUtil().setWidth(1000),
          height: ScreenUtil().setHeight(70),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.phone_android,
                size: 30,
                color: Colors.green,
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                  width: ScreenUtil().setWidth(200),
                  child: Text(AppLocalizations.of(context).translate("username"),style: styleBlack,)),
              SizedBox(
                width: ScreenUtil().setWidth(50),
              ),
              Expanded(
                child: Text('09-111111111'),
              )
            ],
          ),
        ),
      );

  ///For Horizonal Divider
  horizonaldivider() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: ScreenUtil().setWidth(1000),
          height: ScreenUtil().setHeight(0.5),
          color: Colors.black,
        ),
      );

}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
