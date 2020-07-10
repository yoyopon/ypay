import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ypay/Login/LoginPage.dart';

//void main() => runApp(MaterialApp(home: MyApp(),));
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(home: MyApp()));
  });
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoginPage();
  }
}
