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
        orderNo:123456789012345,
        orderImage:Image(image: AssetImage('images/bulb.jpg'),height: 100),
        name: "LOLOKI",
        amount: 100.0,
        orderDate: "22/10/2019",
        status: "Pending Shipping",
      ),
      new OrderItems(
        orderNo:123456789012345,
        orderImage:Image(image: AssetImage('images/bulb.jpg'),height: 100),
        name: "LOLOKI",
        amount: 200.0,
        orderDate: "22/07/2020",
        status: "Pending Shipping",
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
                padding: EdgeInsets.all(5.0),
                child: DataTable(
                 // dataRowHeight: MediaQuery.of(context).size.height*1/12,
                  columns: [
                    DataColumn(label: Text(AppLocalizations.of(context).translate("orderNo"),style: styleBlack,)),
                    DataColumn(label: Text(AppLocalizations.of(context).translate("orderName"),style: styleBlack,)),
                    DataColumn(label: Text(AppLocalizations.of(context).translate("action"),style: styleBlack,)),
                  ],
                  rows: orderLists.map((obj)=>
                    DataRow(
                      cells: <DataCell>[
                      DataCell(Container(
                        width: MediaQuery.of(context).size.width*1.5/7,
                        child: Text(obj.orderNo.toString()))),
                      DataCell(Container(
                        width: MediaQuery.of(context).size.width*1/7,
                        child: Text(obj.name))),
                      DataCell(Container(
                        width: MediaQuery.of(context).size.width*1/7,
                        child: Icon(Icons.view_list,color: Colors.orange[400],)),onTap: onpress)
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
  OrderItems({this.orderNo,this.orderImage,this.name,this.amount,this.orderDate,this.status}); 
}