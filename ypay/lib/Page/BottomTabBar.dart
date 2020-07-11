import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ypay/Page/AccountProfile.dart';
import 'package:ypay/Page/Cart.dart';
import 'package:ypay/Page/Categories.dart';
import 'package:ypay/Page/HomePage.dart';
import 'package:ypay/Page/Message.dart';
import 'package:ypay/Providers/BottomNavigationBarProvider.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  var currentTab = [
    HomePage(),
    Categories(),
    Message(),
    Cart(),
    UserProfile()
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return MaterialApp(
      home: Scaffold(
        body:currentTab[provider.currentIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 0,left: 0,right: 0,top: 5),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.currentIndex = index;
            },
              items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home,color: Colors.black,),
                title: new Text('Home',style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab"),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,color: Colors.black,),
                title: Text('Categories',style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab"),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,color: Colors.black,),
                title: Text('Message',style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab"),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,color: Colors.black,),
                title: Text('Cart',style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab"),),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person,color: Colors.black,),
                title: new Text('Account',style: TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab"),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

