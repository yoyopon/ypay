import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ypay/Page/AccountProfile.dart';
import 'package:ypay/Page/Cart.dart';
import 'package:ypay/Page/Categories.dart';
import 'package:ypay/Page/HomePage.dart';
import 'package:ypay/Page/Message.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/Providers/BottomNavigationBarProvider.dart';
import 'package:ypay/Providers/appLanguage.dart';
import 'package:ypay/dataService/bottomBarPresenter.dart';
import 'package:ypay/designUI/MessageHandel.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> with BottomBarContract{
   bool userLoading=false;
   BottomBarPresenter _presenter;
   int cartItemCount=0;
   
  @override
  void initState() {
    _presenter=new BottomBarPresenter(this, context);
    getUserInfo();
    getStoredLocale();
    super.initState();
    getItemCount();
    getCurrentLocationData();
  }

  getUserInfo(){
    _presenter.getUserData();
    setState(() {
      userLoading=true;
    });
  }

  getStoredLocale()async{
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      UserInfo.currentLocale=prefs.getString("language_code")==null?Locale('en'):Locale(prefs.getString("language_code"));
    });
  }

  getItemCount()async{
    cartItemCount=0;
    for (var i = 0; i < ExampleList.exampleList.length; i++) {
      cartItemCount+=ExampleList.exampleList[i].currentIndex;
    }
    setState(() {
      
    });
  }

  //getLocation
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  void getCurrentLocationData()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _locationData=currentLocation;
        UserInfo.locationData="${_locationData.latitude.toString()},${_locationData.longitude.toString()}";
      });
    });
  }

    @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    ScreenUtil().setSp(30);
    TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab","none","nobold");
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => AppLanguage(),
      child: Consumer<AppLanguage>(builder: (context, model, child){
      return MaterialApp(
        supportedLocales: [
              Locale('en', 'US'),
              Locale('mm', 'MM'),
              Locale('zh', 'CN'),

            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
        home: Scaffold(
          //body:currentTab[provider.currentIndex],
          body: 
          //UserInfo.userInfo==null?
          userLoading==true?
          SpinKitRotatingCircle(
              color: Colors.green,
              size: 50.0,
            ):
          [HomePage(),Categories(),MessagePage(),Cart(),UserProfile()][provider.currentIndex],
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 0,left: 0,right: 0,top: 8),
            child: 
            UserInfo.hideBottomBar==false?
            BottomNavigationBar(
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
                  title: new Text(AppLocalizations.of(context).translate("home"),style: style),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category,),
                  title: Text(AppLocalizations.of(context).translate("categories"),style: style),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message,),
                  title: Text(AppLocalizations.of(context).translate("msg"),style: style),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart,),
                  title: Text(AppLocalizations.of(context).translate("cart")+"(${cartItemCount.toString()})",style: style),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person,),
                  title: new Text(AppLocalizations.of(context).translate("acc"),style: style),
                ),
              ],
            ):Container()
          ),
        ),
      );
    }),
    );
  }

  @override
  void loadUserSuccess(UserInfo data) {
    if(data!=null){
      UserInfo.userInfo=data;
      
    }
    setState(() {
      userLoading=false;
    });
  }

  @override
  void showError(String msg) {
    MessageHandel.showError(context, "", msg.toString());
  }
}

class ExampleList{
  ExampleList(this.image,this.title,this.price,this.isSelected,this.currentIndex);
  final Image image;
  final String title;
  final double price;
  bool isSelected;
  int currentIndex;

  static bool isSelectedField=true;
  static List<ExampleList> exampleList=[
    new ExampleList(Image(image: AssetImage('images/bulb.jpg'),), "Crop tops and High Waist shirts", 10000.00,isSelectedField,1),
    new ExampleList(Image(image: AssetImage('images/bulb.jpg'),), "Crop tops and High Waist shirts", 10000.00,isSelectedField,3),
  ];
}

class MessageCount{
  //static int messageCount=0;
  String action;
  String title;
  String contents;
  String dateTime;
  // int readCount;
  bool isRead;
  MessageCount({this.action,this.title,this.contents,this.dateTime,this.isRead});
  static List<MessageCount> messageList;
}

