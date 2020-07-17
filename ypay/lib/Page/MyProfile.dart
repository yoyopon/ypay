import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Color gradientStart = Colors.blue[400]; //Change start gradient color here
  Color gradientEnd = Colors.orange[500]; //Change end gradient color here
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("My Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "EucrosiaUPC",
                  fontSize: 30)),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(125, 40, 125, 23),
                  child: Container(
                    width: ScreenUtil().setWidth(20),
                    height: ScreenUtil().setHeight(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.winudf.com/v2/image/Y29tLnN1YWRhaDA2MTEuYW5pbWVnaXJsa2F3YWlpYXBwX3NjcmVlbl8yXzE1MjM4OTA0OTRfMDI0/screen-2.jpg?fakeurl=1&type=.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
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
            RaisedButton(
              onPressed: () {
                openAlertBox();
              },
              child: Text('Dialog'),
            )
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
                  width: ScreenUtil().setWidth(200), child: Text('Username')),
              SizedBox(
                width: ScreenUtil().setWidth(50),
              ),
              Expanded(
                child: Text('Khin Eaindra Kyaw'),
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
                  child: Text('Email Address')),
              SizedBox(
                width: ScreenUtil().setWidth(50),
              ),
              Expanded(
                child: Text('khineaindrakyaw@gmail.com'),
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
                  child: Text('Phone Number')),
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

  ///For Alert Dialog Box
  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          'Are you sure you want to logout from your account?')),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    // width: ScreenUtil().setWidth(400),
                    // height: ScreenUtil().setHeight(60),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.5),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: "Roboto Slab Regular",
                                fontSize: 15.0,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    // width: ScreenUtil().setWidth(400),
                    // height: ScreenUtil().setHeight(60),
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
                            'Cancel',
                            style: TextStyle(
                                fontFamily: "Roboto Slab Regular",
                                fontSize: 15.0,
                                color: Colors.black54),
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
