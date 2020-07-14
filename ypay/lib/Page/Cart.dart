import 'package:flutter/material.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<ExampleList> exampleList=[
    new ExampleList(Image(image: AssetImage('images/bulb.jpg'),), "Crop tops and High Waist shirts", 10000.00),
    new ExampleList(Image(image: AssetImage('images/bulb.jpg'),), "Crop tops and High Waist shirts", 10000.00),
  ];
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle=TextStylePage.getStyle(UserInfo.currentLocale,"white", "header","none","");
    TextStyle textblue=TextStylePage.getStyle(UserInfo.currentLocale,"blue", "normal","none","");
    TextStyle textBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
    TextStyle textPrice=TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","");
    TextStyle textWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
    TextStyle styleBold=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","bold");
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
          appBar: AppBar(title: Center(child: Text("Cart",style: headerStyle,)),
            actions: <Widget>[
              Icon(Icons.menu)
            ],
            backgroundColor: Colors.blue[400],
          ),
          body: SingleChildScrollView(
            child: Container(
             child: Column(
               children: <Widget>[
                 ListView.builder(
                   scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                   itemBuilder: (context,i){
                     return Row(children: <Widget>[
                       Checkbox(value: isChecked, onChanged: (bool value) {
                         setState(() {
                           isChecked=value;
                         });
                       },),
                       Container(width: ScreenUtil().setWidth(200),height: ScreenUtil().setHeight(200),child: exampleList[i].image,),
                       Padding(
                         padding: const EdgeInsets.only(left:8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                           Text(exampleList[i].title,style: textblue,),
                           SizedBox(height: ScreenUtil().setHeight(50),),
                           Row(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.only(right:10.0),
                                 child: Text(exampleList[i].price.toString(),style: textPrice,),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left:20.0),
                                 child: Row(children: <Widget>[
                                     Container(
                                       decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                                       child: InkWell(child: Padding(
                                         padding: const EdgeInsets.only(left:7,right:7,top:2,bottom:2),
                                         child: Text("-",style: textBlack,),
                                       ),onTap: (){
                                         //provider.decrement();
                                       },),
                                     ),
                                     Container(
                                       decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey),bottom: BorderSide(color: Colors.grey)),),
                                       child: InkWell(child: Padding(
                                         padding: const EdgeInsets.only(left:7,right:7,top:2,bottom:2),
                                         child: Text("1",style: textBlack,),
                                       ),onTap: (){
                                         //provider.decrement();
                                       },),
                                     ),
                                     Container(
                                       decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                                       child: InkWell(child: Padding(
                                         padding: const EdgeInsets.only(left:7,right:7,top:2,bottom:2),
                                         child: Text("+",style: textBlack,),
                                       ),onTap: (){
                                         //provider.decrement();
                                       },),
                                     ),
                                 ],),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left:4.0),
                                 child: InkWell(
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text("Delete",style: textBlack,),
                                   ),onTap:(){}
                                 ),
                               )
                             ],
                           ),
                         ],),
                       )
                     ],);
                   },
                   itemCount: exampleList.length,
                 ),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Total Amount(Freight Without):",style: textBlack,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text("Your selected items:",style: textBlack,),
                            Text("0",style: styleBold,),
                            Text("items",style: textBlack,),
                            SizedBox(width: ScreenUtil().setWidth(50),),
                            Text("Total Amount:",style: textBlack,),
                            Text("0",style: styleBold,),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Proceed to checkout",style: textWhite,),
                          ),onPressed: (){},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.orange[500],
                          ),
                        ),
                      )
                      ],),
                  ),
                  ),
                ),
               ],
             ),
        ),
          ),
            
          ),
          
        ),
    );
  }
}

class ExampleList{
  ExampleList(this.image,this.title,this.price);
  final Image image;
  final String title;
  final double price;
}
