
import 'package:flutter/material.dart';
import 'package:ypay/Login/LoginPage.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/Page/notificationDetail.dart';
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
    void gotoDetailPage(MessageCount msg){
      Navigator.push(context, MaterialPageRoute
        (builder: (context)=>NotificationDetail(messageDetail:msg)));
    }

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: appBarWidget(),
          body: MessageCount.messageList==null||MessageCount.messageList.length==0||MessageCount.messageList==null?
            Center(child: Text("No Notification Yet"),):
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context,i){
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(bottom:5.0),
                      decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10.0)),
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            MessageCount.messageList[i].isRead==false?
                            Icon(Icons.radio_button_checked,color: Colors.orange[500],size: 30,):
                            Icon(Icons.check_circle_outline,color: Colors.grey,size: 30,),
                            Padding(
                              padding: const EdgeInsets.only(left:13.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Text(MessageCount.messageList[i].action),
                                Text(MessageCount.messageList[i].dateTime)
                              ],),
                            ),
                          ],
                        ),
                        onTap: (){
                          gotoDetailPage(MessageCount.messageList[i]);
                        },
                      ),
                    );
                  },
                  itemCount: MessageCount.messageList.length==null?0:MessageCount.messageList.length,
                ),
              ),
            )

        ),
      ),
    );
  }
}
