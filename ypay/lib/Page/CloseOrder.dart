import 'package:flutter/material.dart';
import 'package:ypay/Page/ManageOrder.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class CloseOrder extends StatefulWidget {
  @override
  _CloseOrderState createState() => _CloseOrderState();
}

class _CloseOrderState extends State<CloseOrder> {
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  @override
  Widget build(BuildContext context) {

    List<OrderItems> orderLists=[
      new OrderItems(
        orderNo:111111111111111,
        orderImage:Image(image: AssetImage('images/bulb.jpg'),height: 100),
        name: "Blue Shirt",
        amount: 100.0,
        orderDate: "22/10/2019",
        status: "Pending Shipping",
        action: InkWell(child: Icon(Icons.delete,color: Colors.red,)),
      ),
      new OrderItems(
        orderNo:222222222222222,
        orderImage:Image(image: AssetImage('images/bulb.jpg'),height: 100),
        name: "White Shirt",
        amount: 200.0,
        orderDate: "22/07/2020",
        status: "Pending Shipping",
        action: InkWell(child: Icon(Icons.delete,color: Colors.red,)),
      )
    ];
    
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
          title: Center(child: Text(AppLocalizations.of(context).translate("close"),style: styleWhite,),),
          backgroundColor: Colors.orange[500],
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.only(top:20,bottom:20),
                child: Text(AppLocalizations.of(context).translate("close"),style: styleBlack,),
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
          ],),
        ),
      ),),
    );
  }
}