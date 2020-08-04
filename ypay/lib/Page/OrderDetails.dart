import 'package:flutter/material.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  TextStyle styleBlack1=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "normal","oldPrice","");
  TextStyle styleBlack2=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","bold");
  TextStyle styleRed=TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","bold");
  
  @override
  Widget build(BuildContext context) {

    List<String> statusList=["Order Complete","Pay Complete","Pending Shipping","Complete"];
    String status;
    status=statusList[2];

    return MaterialApp(
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
          title: Center(child: Text(AppLocalizations.of(context).translate("orderdetails"),style: styleWhite,),),
          backgroundColor: Colors.orange[500],
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
            Container(
                padding: EdgeInsets.only(top:20,bottom:20),
                child: Text(AppLocalizations.of(context).translate("orderdetails"),style: styleBlack,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:20,horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color:Colors.transparent)),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical:10),color: Colors.green,
                      width: MediaQuery.of(context).size.width*0.9/5,
                      child: Center(child: Text(AppLocalizations.of(context).translate("order1"),style: styleWhite,)),),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical:10),
                      color: status=="Pay Complete"||status=="Pending Shipping"||status=="Complete"?Colors.green:Colors.grey,
                      width: MediaQuery.of(context).size.width*0.9/5,
                      child: Center(child: Text(AppLocalizations.of(context).translate("pay"),style: styleWhite,)),),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical:10),
                      color: status=="Pay Complete"||status=="Pending Shipping"||status=="Complete"?Colors.green:Colors.grey,
                      width: MediaQuery.of(context).size.width*0.9/5,
                      child: Center(child: Text(AppLocalizations.of(context).translate("confirm1"),style: styleWhite,))),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical:10),
                      color: status=="Complete"?Colors.green: Colors.grey,
                      width: MediaQuery.of(context).size.width*1.015/5,
                      child: Center(child: Text(AppLocalizations.of(context).translate("delivery"),style: styleWhite,)),),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical:10),
                      color: status=="Complete"? Colors.green:Colors.grey,
                      width: MediaQuery.of(context).size.width*1/5,
                      child: Center(child: Text(AppLocalizations.of(context).translate("complete"),style: styleWhite,)),),
                  ],)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(AppLocalizations.of(context).translate("orderNo")+" : "+"111111111111111",style: styleBlack),
                    ),
                    Divider(color: Colors.grey,),
                    Table(children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("status")+" : ",textAlign: TextAlign.end,style: styleBlack),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(status),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("payments")+" : ",textAlign: TextAlign.end,style: styleBlack),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Balance"),
                        ),
                      ])
                    ],)
                ],),
                  ),),
              ),
              //item description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(AppLocalizations.of(context).translate("itemdes"),style: styleBlack,),
                    ),
                    Divider(color: Colors.grey,),
                    Table(children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(image: AssetImage('images/bulb.jpg'),height: MediaQuery.of(context).size.height*1/9,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("flutter linear progress indicator height"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("unitprice")+" : ",style: styleBlack,textAlign: TextAlign.end,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: <Widget>[
                            Text("79.00",style: styleBlack1,),SizedBox(width: MediaQuery.of(context).size.width*1/14,),Text("79.00")
                          ],)
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("point")+" : ",style: styleBlack,textAlign: TextAlign.end,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("+12"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("quantity")+" : ",style: styleBlack,textAlign: TextAlign.end,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("1"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("amount")+" : ",style: styleBlack,textAlign: TextAlign.end,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("79.00"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("point")+" : ",style: styleBlack,textAlign: TextAlign.end,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12"),
                        ),
                      ])
                    ],),
                    Divider(color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Wrap(children: <Widget>[
                              Text(AppLocalizations.of(context).translate("amount")+":",style: styleBlack,),
                                    Text("79.00 ",style: styleRed,),
                                    Text(" + "),
                              Text(AppLocalizations.of(context).translate("shippingfee")+":",style: styleBlack,),
                                    Text("0.00 ",style: styleRed,),
                                    Text(" + "),
                              Text(AppLocalizations.of(context).translate("processingfee")+":",style: styleBlack,),
                                    Text("0.00 ",style: styleRed,),
                                    Text(" + "),
                              Text(AppLocalizations.of(context).translate("taxes")+":",style: styleBlack,),
                                    Text("3.16",style: styleRed,),
                            ],),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(AppLocalizations.of(context).translate("totalamt")+" : ",style: styleBlack2,),
                          Text("82.16",style: styleRed,),
                        ],
                      ),
                    )
                ],),
                  ),),
              ),

              //delivery Info
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(AppLocalizations.of(context).translate("deliveryinfo"),style: styleBlack,),
                    ),
                    Divider(color: Colors.grey,),
                    Table(children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("customername")+" : ",textAlign: TextAlign.end,style: styleBlack,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("loloki"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("deliveryaddress")+" : ",textAlign: TextAlign.end,style: styleBlack,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Yangon"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("username")+" : ",textAlign: TextAlign.end,style: styleBlack,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Phone"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("email")+" : ",textAlign: TextAlign.end,style: styleBlack,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("email"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("comments")+" : ",textAlign: TextAlign.end,style: styleBlack,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("comments"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("invoiced")+" : ",textAlign: TextAlign.end,style: styleBlack,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Yes"),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("invoice")+" : ",textAlign: TextAlign.end,style: styleBlack,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("2wwww"),
                        ),
                      ])
                    ],)
                ],),
                  ),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*1/7,)
          ],),
        ),
      ),),
    );
  }
}