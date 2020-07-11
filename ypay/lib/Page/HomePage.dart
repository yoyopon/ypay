import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final formKey = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    return MaterialApp(
      home: SafeArea(child: Scaffold(body: ShowList())),
    );
  }

  ///For ShowList
  Widget ShowList() {
    return ListView(
      children: <Widget>[
        HeaderSlide(),
        SizedBox(height: 5.0),
        _buildSearch(),
        SizedBox(height: 5.0),
        flatButtom(),
      ],
    );
  }

  ///For Header Slide Bar
  Widget HeaderSlide() {
    TextStyle _styles = TextStyle(fontSize: 30, color: Colors.white);
    TextStyle _style = TextStyle(fontSize: 25, color: Colors.white);
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5.0),
      height: ScreenUtil().setHeight(250),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
        ),
        items: <Widget>[
          Container(
              width: 600.0,
              color: Colors.red,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Welcome Ypay',
                      style: _styles,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Ypay',
                      style: _style,
                    ),
                    SizedBox(height: 5.0),
                    FlatButton(onPressed: () {}, child: Text('OK >'))
                  ],
                ),
              )),
          Container(
              width: 600.0,
              color: Colors.yellow,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Welcome Ypay',
                      style: _styles,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Ypay',
                      style: _style,
                    ),
                    SizedBox(height: 5.0),
                    FlatButton(onPressed: () {}, child: Text('OK >'))
                  ],
                ),
              )),
          Container(
              width: 600.0,
              color: Colors.green,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Welcome Ypay',
                      style: _styles,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Ypay',
                      style: _style,
                    ),
                    SizedBox(height: 5.0),
                    FlatButton(onPressed: () {}, child: Text('OK >'))
                  ],
                ),
              )),
          Container(
              width: 600.0,
              color: Colors.blue,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Welcome Ypay',
                      style: _styles,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Ypay',
                      style: _style,
                    ),
                    SizedBox(height: 5.0),
                    FlatButton(onPressed: () {}, child: Text('OK >'))
                  ],
                ),
              )),
          Container(
              width: 600.0,
              color: Colors.black,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Welcome Ypay',
                      style: _styles,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Ypay',
                      style: _style,
                    ),
                    SizedBox(height: 5.0),
                    FlatButton(onPressed: () {}, child: Text('OK >'))
                  ],
                ),
              )),
        ],
      ),
    );
  }

  ///For Search Bar
  Widget _buildSearch() => Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.green,
        height: 50.0,
        child: Row(
          children: <Widget>[
            Icon(Icons.account_circle),
            Flexible(
              flex: 2,
              child: TextFormField(
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 11.0),
                decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ), // icon is 48px widget.
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
              ),
            ),
            Icon(Icons.filter_center_focus)
          ],
        ),
      );

  ///For FlatButtom
  Widget flatButtom() => Container();
}
