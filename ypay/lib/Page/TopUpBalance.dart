import 'package:flutter/material.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class TopUpBalance extends StatefulWidget {
  @override
  _TopUpBalanceState createState() => _TopUpBalanceState();
}

class _TopUpBalanceState extends State<TopUpBalance> {
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
  TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  TextStyle styleRed=TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","");
  List<PayMentMethods> deliMethods=<PayMentMethods>[
    PayMentMethods(id:1,name:"Kbzpay"),
    PayMentMethods(id:2,name:"Ayapay"),
    PayMentMethods(id:3,name:"WechatPay"),
  ];
  int currentIndex=0;
  TextEditingController txtBalance=TextEditingController();bool errorShow=false;bool errorShow1=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context).translate("recharge"),style: styleWhite,),
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
            backgroundColor: Colors.orange[500],
          ),
          body: 
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:20,bottom:30),
                    child: Text(AppLocalizations.of(context).translate("acc")+" "+AppLocalizations.of(context).translate("re"),style: style,),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical:15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,  
                    children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*2/5,
                      child: Text(AppLocalizations.of(context).translate("balance")+": ",style: style,)),
                    Text(AppLocalizations.of(context).translate("curbal")+":",style: style,),
                    Text("0000",style: styleRed,)
                  ],),),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical:15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,    
                    children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*2/5,
                      child: Text(AppLocalizations.of(context).translate("rechargeamt")+": ",style: style,)),
                    Container(
                      width: MediaQuery.of(context).size.width*1.5/3,
                      child: TextFormField(
                        controller: txtBalance,
                        decoration: InputDecoration(
                          prefixIcon: errorShow?Icon(Icons.error_outline,color: Colors.red,):null,
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
                          hintText: ""
                        ),
                      ),
                    ),
                  ],),),
                  errorShow?
                  Container(
                    padding: const EdgeInsets.symmetric(vertical:15.0),
                    child: Row(children: <Widget>[
                      Container(width: MediaQuery.of(context).size.width*2/5,),
                      Container(
                        child: Text("Enter balance",style: styleRed,),
                      )
                    ],),
                  ):Container(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical:15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,  
                    children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*2/5,
                      child: Text(AppLocalizations.of(context).translate("payments")+":",style: style,)),
                    Container(
                      width: MediaQuery.of(context).size.width*2.5/5,
                      //decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                      child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: 
                        deliMethods.map((obj)=>RadioListTile(
                          groupValue: currentIndex,
                          value: obj.id,
                          title: Text(obj.name,style: style,),
                          onChanged: (val){
                            setState(() {
                              currentIndex=val;
                            });
                          }
                        )).toList()
                      ),
                    ),
                  ],),),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Visibility(
                        visible: currentIndex!=0,
                        child: Icon(Icons.check_circle,color: Colors.orange[500],),
                      ),
                  ),
                  errorShow1?
                  Container(
                    padding: const EdgeInsets.symmetric(vertical:15.0),
                    child: Row(children: <Widget>[
                      Container(width: MediaQuery.of(context).size.width*2/5,),
                      Container(
                        child: Text("Please select at least one option",style: styleRed,),
                      )
                    ],),
                  ):Container(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Container(width: MediaQuery.of(context).size.width*2/5,),
                        RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).translate("re"),style: styleWhite,),
                        ),
                        onPressed: (){
                          if(txtBalance.text==""||txtBalance.text==null){
                            errorShow=true;
                          }
                          if(currentIndex==0){
                            errorShow1=true;
                          }
                          setState(() {
                            
                          });
                        },
                        color: Colors.orange[500],
                  ),
                      ],
                    ),)
                ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PayMentMethods{
  PayMentMethods({this.id,this.name});
  final int id;final String name;
}