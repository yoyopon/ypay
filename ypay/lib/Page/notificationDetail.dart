import 'package:flutter/material.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDetail extends StatefulWidget {
  final MessageCount messageDetail;
  NotificationDetail({this.messageDetail}):super();
  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold");
    TextStyle normalStyle=TextStyle(fontFamily:"Roboto Slab Regular",color: Colors.black87);
    TextStyle headerStyle=TextStyle(fontFamily:"Roboto Slab Regular",color: Colors.black87,
      fontSize: ScreenUtil().setSp(60,allowFontScalingSelf: true));

    void updateReadCount(){
      widget.messageDetail.isRead=true;
      
    }

    return MaterialApp(
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[500],
          title: Text(AppLocalizations.of(context).translate("notidetail"),style: styleWhite,),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          updateReadCount();
          Navigator.pop(context);
        },),),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*1/4,
              child: Icon(Icons.account_circle,size: MediaQuery.of(context).size.width*1/5,color: Colors.orange[500],),
              ),
            Container(
              height: MediaQuery.of(context).size.height*1/10,
              padding: EdgeInsets.all(10.0),child: Text(widget.messageDetail.title,style: headerStyle,),),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Container(child: Text("Processing Action : ",textAlign: TextAlign.end,style: normalStyle,),padding: EdgeInsets.all(5.0),),
                    Container(child: Text(widget.messageDetail.action,style: normalStyle,),padding: EdgeInsets.all(5.0),)
                  ]),
                  TableRow(children: [
                    Container(child: Text("Message : ",textAlign: TextAlign.end,style: normalStyle,),padding: EdgeInsets.all(5.0),),
                    Container(child: Text(widget.messageDetail.contents,style: normalStyle,),padding: EdgeInsets.all(5.0),)
                  ]),
                  TableRow(children: [
                    Container(child: Text("Processing Date : ",textAlign: TextAlign.end,style: normalStyle,),padding: EdgeInsets.all(5.0),),
                    Container(child: Text(widget.messageDetail.dateTime,style: normalStyle,),padding: EdgeInsets.all(5.0),)
                  ]),
                ],
              ),
            )
          ],),
        ),
      ),),
    );
  }
}