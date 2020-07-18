import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ypay/Login/LoginPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/Providers/BottomNavigationBarProvider.dart';
import 'package:ypay/Providers/DetailsProvider.dart';
import 'package:ypay/Providers/appLanguage.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dbHelper/DatabaseHelper.dart';
import 'model/userInfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  var dbHelper = DBHelper();
  UserInfo info;//=await dbHelper.getUserInfo();
  dbHelper.getUserInfo().then((res){
    info=res;
    print(info.name);
  });
  //await new Future.delayed(const Duration(seconds: 3));
  runApp(
    Phoenix(child: MyApp(appLanguage: appLanguage,userInfo: info,))
   //MyApp(appLanguage: appLanguage,userInfo:info)
  );
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;final UserInfo userInfo;
  MyApp({this.appLanguage,this.userInfo});
  
  @override
  Widget build(BuildContext context) {
    //ScreenUtil().setSp(30);
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage(),),
      ChangeNotifierProvider<BottomNavigationBarProvider>(create: (_) => BottomNavigationBarProvider(),),
      ChangeNotifierProvider<DetailsProvider>(create: (_) => DetailsProvider(),),
      ],
      child: Consumer<AppLanguage>(builder: (context, model, child) {
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
           title: 'Flutter Demo',
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             primarySwatch: Colors.blue,
           ),
           home: //LoginPage()
           userInfo!=null?BottomTabBar():LoginPage(),
            );
        }
      ),
    );  
  }
}



