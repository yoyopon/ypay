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
    TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab","none","nobold");
    return MaterialApp(
      home: Scaffold(
        body:currentTab[provider.currentIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 0,left: 0,right: 0,top: 8),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: Color(0xff4AB055),
            unselectedItemColor: Colors.grey,
            currentIndex: provider.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              provider.currentIndex = index;
            },
              items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home,),
                title: new Text('Home',style: style),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category,),
                title: Text('Categories',style: style),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message,),
                title: Text('Message',style: style),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart,),
                title: Text('Cart',style: style),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person,),
                title: new Text('Account',style: style),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

