import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ypay/Page/ConfirmPayMent.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
  TextStyle styleGrey=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "normal","none","");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  TextStyle styleBlue=TextStylePage.getStyle(UserInfo.currentLocale,"blue", "normal","none","");
  TextStyle styleBold=TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","bold");
  TextStyle styleSmall=TextStylePage.getStyle(UserInfo.currentLocale,"white", "bottomtab","none","");
  PayMentDelivery selectedValue;
  var notInvoicingText = TextEditingController();
  var addressText = TextEditingController();
  var commentText = TextEditingController();
  final formKey=new GlobalKey<FormState>();
  List<PayMentDelivery> deliMethods=<PayMentDelivery>[
    PayMentDelivery(id:1,name:"Kbzpay"),
    PayMentDelivery(id:2,name:"Ayapay"),
    PayMentDelivery(id:3,name:"Cash on Deliver"),
    PayMentDelivery(id:4,name:"Balance"),
  ];
  bool visible=false;bool visible1=false;bool visible2=false;bool balanceVisible=false;
  FocusNode notInvoicingNode=FocusNode();
  FocusNode addressNode=FocusNode();
  FocusNode commentNode=FocusNode();
  
  
  @override
  void initState() {
    super.initState();
    commentText.addListener((){
      setState(() {
        visible=commentText.text.length>0?true:false;
      });
    });
    notInvoicingText.addListener((){
      setState(() {
        visible1=notInvoicingText.text.length>0?true:false;
      });
    });
    addressText.addListener((){
      setState(() {
        visible2=addressText.text.length>0?true:false;
      });
    });
  }

  void addressCheck(AddressCheckBoxList add1){
      for (var item in AddressCheckBoxList.addressCheckBoxList) {
        if(item==add1){
          item.isSelected=true;
          addressText.text=item.addressName;
        }
        else{
          item.isSelected=false;
        }
      }
      setState(() {
        
      });
    }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);

    return GestureDetector(
        onTap: (){
          if (notInvoicingNode.hasFocus) {
            notInvoicingNode.unfocus();
            //FocusScope.of(context).requestFocus(addressNode);
          }
          if (addressNode.hasFocus) {
            addressNode.unfocus();
            //FocusScope.of(context).requestFocus(commentNode);
          }
          if (commentNode.hasFocus) {
            commentNode.unfocus();
          }
        },
        child: MaterialApp(home: SafeArea(child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Center(child: Text("Confirm Order",style: style,)),
        leading: IconButton(icon:Icon(Icons.arrow_back,),onPressed: (){
          Navigator.of(context).pop();
        },),
          actions: <Widget>[
            Icon(Icons.menu)
          ],
          backgroundColor: Colors.orange[500],
        ),
        body: Form(
          key: formKey,
            child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: <Widget>[
              AddressCheckBoxList.addressCheckBoxList==null||AddressCheckBoxList.addressCheckBoxList.length<=0?
              Container():
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context,i){
                  return Row(children: <Widget>[
                    Checkbox(
                      value: AddressCheckBoxList.addressCheckBoxList[i].isSelected,
                      onChanged: (bool value){
                        setState(() {
                          AddressCheckBoxList.addressCheckBoxList[i].isSelected=value;
                        });
                        addressCheck(AddressCheckBoxList.addressCheckBoxList[i]);
                      },
                    ),
                    Text(AddressCheckBoxList.addressCheckBoxList[i].addressName)
                  ],);
                },
              itemCount: AddressCheckBoxList.addressCheckBoxList.length,
              ),
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
                           balanceVisible=selectedValue.name.contains("Balance")?true:false;
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
                  Visibility(
                    visible: balanceVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                      child: Container(
                        width: ScreenUtil().setWidth(1000),
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Balance(Fee0.0)"),
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                    child: Container(
                      width: ScreenUtil().setWidth(1000),
                      decoration: BoxDecoration(
                        border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Direct(Freight0.0)"),
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                    child: TextFormField(style: styleBlack,
                    controller: notInvoicingText,
                    focusNode: notInvoicingNode,
                    maxLines: 2,
                      decoration: InputDecoration(
                        hintText: ("Not Invoicing"),
                        hintStyle: styleGrey,
                        //suffixIcon: getClearButton(),
                        suffixIcon:Visibility(
                          visible: visible1,
                          child: IconButton(icon: Icon(Icons.clear,color: Colors.grey,),
                            onPressed: (){notInvoicingText.clear();},
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                    child: TextFormField(style: styleBlack,
                    controller: addressText,
                    focusNode: addressNode,
                    maxLines: 4,
                      decoration: InputDecoration(
                        hintText: ("Enter Address"),
                        hintStyle: styleGrey,
                        //suffixIcon: getClearButton(),
                        suffixIcon:Visibility(
                          visible: visible2,
                          child: IconButton(icon: Icon(Icons.clear,color: Colors.grey,),
                            onPressed: (){addressText.clear();},
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6,left: 5,right: 5),
                    child: TextFormField(style: styleBlack,
                    controller: commentText,
                    focusNode: commentNode,
                      decoration: InputDecoration(
                        hintText: ("Enter Comment"),
                        hintStyle: styleGrey,
                        //suffixIcon: getClearButton(),
                        suffixIcon:Visibility(
                          visible: visible,
                          child: IconButton(icon: Icon(Icons.clear,color: Colors.grey,),
                            onPressed: (){commentText.clear();},
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        )
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
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            color: Colors.blue[400],
            onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPayMent()));
              if(addressText.text!=""||addressText.text!=null){
                AddressCheckBoxList add1=new AddressCheckBoxList(addressName:addressText.text,isSelected: false);
                if(AddressCheckBoxList.addressCheckBoxList==null){
                  AddressCheckBoxList.addressCheckBoxList=new List<AddressCheckBoxList>();
                }
                if(AddressCheckBoxList.addressCheckBoxList.length==10){
                  AddressCheckBoxList.addressCheckBoxList.removeAt(0);
                }
                AddressCheckBoxList.addressCheckBoxList.add(add1);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPayMent()));
              }
            },
            child: Text("Save Changes",style:style),
          ),
        ),
      ),),),
    );
  }
}

class PayMentDelivery{
  PayMentDelivery({this.id,this.name});
  final int id;final String name;
}

class AddressCheckBoxList{
  String addressName;
  bool isSelected;
  AddressCheckBoxList({this.addressName,this.isSelected});
  static List<AddressCheckBoxList> addressCheckBoxList;
}