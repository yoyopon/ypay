import 'package:flutter/material.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:ypay/Page/BottomTabBar.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartPage();
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartPage> {

  
  int selectedItem=0;
  

  @override
  void initState() {
    super.initState();
    getSelectedItems();
    initPlatformState();
  }

  getSelectedItems()async{
    selectedItem=0;
    for (var item in ExampleList.exampleList) {
      selectedItem+=item.currentIndex;
    }
  }

  //IMEI plugin
  String _platformImei = 'Unknown';
  String uniqueId = "Unknown";

  Future<void> initPlatformState() async {
    String platformImei;
    String idunique;
    try {
      platformImei =
          await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
      List<String> multiImei = await ImeiPlugin.getImeiMulti();
      print(multiImei);
      idunique = await ImeiPlugin.getId();
    } 
    catch(ex){
      print(ex.toString());
    }
    // on PlatformException {
    //   platformImei = 'Failed to get platform version.';
    // }
    
    if (!mounted) return;

    setState(() {
      _platformImei = platformImei;
      uniqueId = idunique;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textblue=TextStylePage.getStyle(UserInfo.currentLocale,"blue", "normal","none","");
    TextStyle textBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
    TextStyle textPrice=TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","");
    TextStyle textWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","");
    TextStyle styleBold=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","bold");
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
          appBar: AppBar(title: Center(child: Text("Cart",style: textWhite,)),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.menu),onPressed: (){
                showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      actions: <Widget>[
                        FlatButton(child: Text("OK"),onPressed: (){Navigator.pop(context);},)
                      ],
                      content:
                      Text('Running on: $_platformImei\n is equal to : $uniqueId\nCurrent Location:${UserInfo.locationData}'),
                    );
                  }
                );
              },)
            ],
            backgroundColor: Colors.blue[400],
          ),
          body: SingleChildScrollView(
            child: Container(
             child: Column(
               children: <Widget>[
                 ListView.separated(
                   scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                   itemBuilder: (context,i){
                     return Row(children: <Widget>[
                       Checkbox(
                         value: ExampleList.exampleList[i].isSelected,
                         onChanged: (bool value) {
                         setState(() {
                           ExampleList.exampleList[i].isSelected=value;
                         });
                       },),
                       Container(width: ScreenUtil().setWidth(200),height: ScreenUtil().setHeight(200),
                        child: ExampleList.exampleList[i].image,),
                       Padding(
                         padding: const EdgeInsets.only(left:8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                           Text(ExampleList.exampleList[i].title,style: textblue,),
                           SizedBox(height: ScreenUtil().setHeight(50),),
                           Row(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.only(right:10.0),
                                 child: Text(ExampleList.exampleList[i].price.toString(),style: textPrice,),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left:20.0),
                                 child: Row(children: <Widget>[
                                     Container(
                                       decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                                       child: InkWell(child: Padding(
                                         padding: const EdgeInsets.only(left:8,right:8,top:3,bottom:3),
                                         child: Text("-",style: textBlack,),
                                       ),onTap: (){
                                         setState(() {
                                           ExampleList.exampleList[i].currentIndex--;
                                           if(ExampleList.exampleList[i].currentIndex<=0){ExampleList.exampleList[i].currentIndex=1;}
                                           getSelectedItems();
                                         });
                                       },),
                                     ),
                                     Container(
                                       decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey),bottom: BorderSide(color: Colors.grey)),),
                                       child: InkWell(child: Padding(
                                         padding: const EdgeInsets.only(left:8,right:8,top:3,bottom:3),
                                         child: Text(
                                         ExampleList.exampleList[i].currentIndex.toString(),
                                         style: textBlack,),
                                       ),onTap: (){
                                       },),
                                     ),
                                     Container(
                                       decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                                       child: InkWell(child: Padding(
                                         padding: const EdgeInsets.only(left:8,right:8,top:3,bottom:3),
                                         child: Text("+",style: textBlack,),
                                       ),onTap: (){
                                         setState(() {
                                           ExampleList.exampleList[i].currentIndex++;
                                           if(ExampleList.exampleList[i].currentIndex<=0){ExampleList.exampleList[i].currentIndex=1;}
                                           getSelectedItems();
                                         });
                                       },),
                                     ),
                                 ],),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left:4.0),
                                 child: InkWell(
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Icon(Icons.delete,color: Colors.red,),
                                   ),onTap:(){}
                                 ),
                               )
                             ],
                           ),
                         ],),
                       )
                     ],);
                   },
                   itemCount: ExampleList.exampleList.length,
                   separatorBuilder: (context,index){
                     return Divider(color: Colors.grey,);
                   },
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
                            Text(selectedItem.toString(),style: styleBold,),
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


