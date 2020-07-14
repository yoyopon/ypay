import 'package:flutter/material.dart';
import 'package:ypay/Page/ConfirmPayMent.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  TextStyle styleBlue=TextStylePage.getStyle(UserInfo.currentLocale,"blue", "normal","none","");
  TextStyle style1=TextStylePage.getStyle(UserInfo.currentLocale,"white", "header","none","");
  TextStyle styleBold=TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","bold");
  PayMentDelivery selectedValue;
  List<PayMentDelivery> deliMethods=<PayMentDelivery>[
    PayMentDelivery(1,"Kbzpay"),
    PayMentDelivery(2,"Ayapay"),
    PayMentDelivery(3,"Cash on Deliver"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(child: Scaffold(
      appBar: AppBar(title: Center(child: Text("Confirm Order",style: style1,)),
      leading: InkWell(
        child: Row(children: <Widget>[
          Icon(Icons.arrow_back_ios),Text("Back",style: style)
        ],),onTap: (){Navigator.pop(context);},
        ),
        actions: <Widget>[
          Icon(Icons.menu)
        ],
        backgroundColor: Colors.orange[500],
      ),
      body: ListView(
        // scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // physics: ScrollPhysics(),
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10.0)),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 3,bottom:3,left: 10,),
                child: DropdownButton(
                  hint:  Text("Payment Delivery Method",style: styleBlue,),
                  value: selectedValue,
                  onChanged: (PayMentDelivery value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  style: styleBlue,
                  items: deliMethods.map((PayMentDelivery s){
                    return DropdownMenuItem<PayMentDelivery>(
                      value: s,
                      child: Text(s.name,),
                    );
                  }).toList()
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:5,left: 5,right: 5),
                child: TextFormField(
                  style: style,
                  decoration: InputDecoration(
                    hintText: ("Balance(Fee0.0)"),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                child: TextFormField(style: style,
                  decoration: InputDecoration(
                    hintText: ("Direct(Freight0.0)"),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                child: TextFormField(style: style,
                  decoration: InputDecoration(
                    hintText: ("Not Invoicing"),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                child: TextFormField(style: style,
                  decoration: InputDecoration(
                    hintText: ("Enter Comment"),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:6,bottom: 5,left: 10),
                child: Icon(Icons.check_circle,color: Colors.green,),
              )
            ],),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Item Information",style: styleBlue,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Item Name",style: styleBlack,),
                ),
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8,bottom:8,left:15,right:8),
                    child: Text("500.0",style: TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","bold"),),
                  ),Expanded(child: SizedBox(),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Quantity 1",style: styleBlack,),
                  )
                ],)
              ],),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10.0)),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    Text("Total amount: ",style: styleBlue,),Text("500",style:styleBold)
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(child: Row(children: <Widget>[
                        Text("Freight: ",style:styleBlack),Text("0.0,",style:styleBold)
                      ],),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(child: Row(children: <Widget>[
                        Text("Pay process Fee: ",style:styleBlack),Text("0.0,",style:styleBold)
                      ],),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(child: Row(children: <Widget>[
                        Text("Taxes: ",style:styleBlack),Text("0.0,",style:styleBold)
                      ],),),
                    ),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(child: Row(children: <Widget>[
                        Text("Total Amount: ",style:styleBlack),Text("0.0,",style:styleBold)
                      ],),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(child: Row(children: <Widget>[
                        Text("1 ",style:styleBold),Text("Items,",style:styleBlack)
                      ],),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(child: Row(children: <Widget>[
                        Text("Point: ",style:styleBlack),Text("2,",style:styleBold)
                      ],),),
                    ),
                  ],),
                ),
              ],),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.blue[400],
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPayMent()));
          },
          child: Text("S a v e    C h a n g e s",style:style),
        ),
      ),
    ),),);
  }
}

class PayMentDelivery{
  PayMentDelivery(this.id,this.name);
  final int id;final String name;
}