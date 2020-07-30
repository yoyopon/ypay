import 'package:flutter/material.dart';
import 'package:ypay/Page/OrderDetails.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class ManageOrder extends StatefulWidget {
  @override
  _ManageOrderState createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  TextStyle styleBlue=TextStylePage.getStyle(UserInfo.currentLocale,"blue", "normal","none","");
  @override
  Widget build(BuildContext context) {

    void onpress(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails()));
    }

    List<OrderItems> orderLists=[
      new OrderItems(
        orderNo:111111111111111,
        orderImage:Image(image: AssetImage('images/bulb.jpg'),height: 100),
        name: "Blue Shirt",
        amount: 100.0,
        orderDate: "22/10/2019",
        status: "Pending Shipping",
        action: InkWell(child: Text("Order Details",style: styleBlue,),onTap: onpress,),
      ),
      new OrderItems(
        orderNo:222222222222222,
        orderImage:Image(image: AssetImage('images/bulb.jpg'),height: 100),
        name: "White Shirt",
        amount: 200.0,
        orderDate: "22/07/2020",
        status: "Pending Shipping",
        action: InkWell(child: Text("Order Details",style: styleBlue,),onTap: onpress,),
      )
    ];
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
          title: Center(child: Text(AppLocalizations.of(context).translate("manage"),style: styleWhite,),),
          backgroundColor: Colors.orange[500],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:20,bottom:20),
                child: Text(AppLocalizations.of(context).translate("manage"),style: styleBlack,),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: DataTable(
                  
                  columns: [
                    DataColumn(label: Text(AppLocalizations.of(context).translate("orderNo"),style: styleBlack,)),
                    DataColumn(label: Text(AppLocalizations.of(context).translate("orderName"),style: styleBlack,)),
                    DataColumn(label: Text(AppLocalizations.of(context).translate("action"),style: styleBlack,)),
                  ],
                  rows: orderLists.map((obj)=>
                    DataRow(cells: <DataCell>[
                      DataCell(Text(obj.orderNo.toString())),
                      DataCell(Text(obj.name)),
                      DataCell(obj.action)
                    ])
                  ).toList()
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}

class OrderItems{
  final int orderNo;
  final Image orderImage;
  final String name;
  final double amount;
  final String orderDate;
  final String status;
  final InkWell action;
  OrderItems({this.orderNo,this.orderImage,this.name,this.amount,this.orderDate,this.status,this.action}); 
}