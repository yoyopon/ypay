import 'package:flutter/material.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class ConfirmPayMent extends StatefulWidget {
  @override
  _ConfirmPayMentState createState() => _ConfirmPayMentState();
}

class _ConfirmPayMentState extends State<ConfirmPayMent> {
  TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  TextStyle style1=TextStylePage.getStyle(UserInfo.currentLocale,"white", "header","none","");
  TextStyle styleBlue=TextStylePage.getStyle(UserInfo.currentLocale,"blue", "normal","none","");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(child: Scaffold(
      appBar: AppBar(title: Center(child: Text("Confirm PayMent",style: style1,)),
      leading: InkWell(
        child: Row(children: <Widget>[
          Icon(Icons.arrow_back_ios),Text("Back",style: style)
        ],),onTap: (){Navigator.pop(context);},
        ),
        actions: <Widget>[
          Icon(Icons.menu)
        ],
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:8,left: 8,right: 8,bottom: 10),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Confirm Payment Information",style: styleBlue,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(color: Colors.grey,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Order No",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Address",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Full Address",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Mobile",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Mobile No",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Comment",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Total Amount",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Payment",style: styleBlack,),
                            ),Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("B200",style: styleBlack,),
                            )
                          ]),
                        ],),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                color: Colors.orange[500],
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top:5,bottom:5),
                  child: Text("Confirm Payment",style: style,),
                ),
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    ),),
      
    );
  }
}