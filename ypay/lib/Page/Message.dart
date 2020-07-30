
import 'package:flutter/material.dart';
import 'package:ypay/Login/LoginPage.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextStyle styleWhite=TextStylePage.getStyle(LoginPageState.styleLocale,"white", "normal","none","nobold");

  @override
  Widget build(BuildContext context) {
    Widget appBarWidget(){
      if(UserInfo.prevFormsgPage=="acc"){
        return AppBar(title: Text(AppLocalizations.of(context).translate("msg"),style: styleWhite,),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            UserInfo.prevFormsgPage=null;
            Navigator.pop(context);
          },),
          backgroundColor: Colors.orange[500],
        );
      }else{
        return null;
      }
    }
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: appBarWidget(),
          body: Center(
            child: Text(AppLocalizations.of(context).translate("msg")),
            // child: FlatButton(child: Text("test"),
            //   onPressed: (){
            //     print(UserInfo.fileImage.path);
            //     String text=UserInfo.fileImage.path.toString();
            //     int fIndex=text.indexOf('/');
            //     int lIndex=text.lastIndexOf("'");
            //     print(text.substring(fIndex,lIndex));
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
