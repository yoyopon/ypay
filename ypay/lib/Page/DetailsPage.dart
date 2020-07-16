import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ypay/Page/ConfirmOrder.dart';
import 'package:ypay/Providers/DetailsProvider.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _current = 0;
  final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

  List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

  @override
  Widget build(BuildContext context) {
    TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
    TextStyle style1=TextStylePage.getStyle(UserInfo.currentLocale,"black", "header","none","");
    var provider = Provider.of<DetailsProvider>(context);
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: Text("Details",style:TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","")),
          leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),backgroundColor: Colors.white,),
        body: SingleChildScrollView(child: Column(children: <Widget>[
          //Carousel section
          Container(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  items:imgList.map((item)=>Container(
                    child: Center(
                      child: Image.network(item, fit: BoxFit.cover, width: 1000)
                    ),
                  )).toList(),
                  options: CarouselOptions(
                    onPageChanged: (i,index){
                      setState(() {
                        _current = i;
                      });
                    }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.redAccent : Colors.green,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),//end of carousel
          //title section
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,bottom: 8,),
            child: Text("Bellflower Forest Super Fairy Two-Piece suit shirt",style:TextStylePage.getStyle(UserInfo.currentLocale,"grey", "header","none","")),
          ),//end of title section
          Padding(//price section
            padding: const EdgeInsets.only(top: 10,left: 10,bottom: 8,),
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text("Ks 125,000",style:TextStylePage.getStyle(UserInfo.currentLocale,"red", "price","none","")),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text("Ks 250,000",style:TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","oldPrice","")),
              )
            ],),
          ),//price section end
          Padding(padding: EdgeInsets.only(top:20,bottom:10),),
          Container(//item property
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(children: <Widget>[
              Row(//size
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:10,right:40),
                    child: Text("Size",style: style,),
                  ),
                  Expanded(
                      child: Wrap(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: InkWell(child: Text("Small",style: style,),onTap: (){},)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: InkWell(child: Text("Medium",style: style,),onTap: (){},)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: InkWell(child: Text("Large",style: style,),onTap: (){},)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: InkWell(child: Text("XL",style: style,),onTap: (){},)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: InkWell(child: Text("XXL",style: style,),onTap: (){},)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: InkWell(child: Text("XXXL",style: style,),onTap: (){},)
                        ),
                      ),
                    ],),
                  ),
                ],
              ),//size end
              Row(//quantity 
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:10,right:25),
                    child: Text("Quantity",style: style,),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top:10,bottom:10),
                        child: Row(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                            child: InkWell(child: Padding(
                              padding: const EdgeInsets.only(left:15,right:15,top:5,bottom:5),
                              child: Text("-",style: style,),
                            ),onTap: (){
                              provider.decrement();
                            },),
                          ),
                          Container(
                            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey),bottom: BorderSide(color: Colors.grey)),),
                            child: InkWell(child: Padding(
                              padding: const EdgeInsets.only(left:15,right:15,top:5,bottom:5),
                              child: Text(provider.currentIndex.toString(),style: style,),
                            ),onTap: (){},),
                          ),
                          Container(
                            decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                            child: InkWell(child: Padding(
                              padding: const EdgeInsets.only(left:15,right:15,top:5,bottom:5),
                              child: Text("+",style: style,),
                            ),onTap: (){
                              provider.increment();
                            },),
                          ),
                        ],),
                      ),
                  ),
                ],
              )//quantity end
            ],),
          ),//item property end
          //product description
          Container(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:0,vertical:30),
                child: Text("Product Description",style: style1,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Pattern: ",style: style,),Text("plain",style: style,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Style: ",style: style,),Text("Commuter",style: style,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Commuter: ",style: style,),Text("Korean",style: style,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Collar Type: ",style: style,),Text("POLO Collar",style: style,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Waist Type: ",style: style,),Text("high waist",style: style,)
                ],),
              )
            ],),
          ),
          //product description end

          //store recommended
          Container(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:30,bottom:10),
                child: FlatButton(child: Text("...Store Recommended...",style: style1,),onPressed: (){},),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Wrap(children: <Widget>[
                      Card(child: InkWell(
                          child: Column(children: <Widget>[
                          Image(image: AssetImage('images/bulb.jpg'),width: ScreenUtil().setWidth(250),height:ScreenUtil().setHeight(250),),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Spring and autu",style: style,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Ks9,600",style: TextStylePage.getStyle(UserInfo.currentLocale, "red", "header","none",""),),
                          )
                        ],),
                        onTap: (){},
                      ),),
                      Card(child: InkWell(
                          child: Column(children: <Widget>[
                          Image(image: AssetImage('images/bulb.jpg'),width: ScreenUtil().setWidth(250),height:ScreenUtil().setHeight(250),),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Spring and autu",style: style,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Ks9,600",style: TextStylePage.getStyle(UserInfo.currentLocale, "red", "header","none",""),),
                          )
                        ],),
                        onTap: (){},
                      ),),
                      Card(child: InkWell(
                          child: Column(children: <Widget>[
                          Image(image: AssetImage('images/bulb.jpg'),width: ScreenUtil().setWidth(250),height:ScreenUtil().setHeight(250),),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Spring and autu",style: style,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Ks9,600",style: TextStylePage.getStyle(UserInfo.currentLocale, "red", "header","none",""),),
                          )
                        ],),
                        onTap: (){},
                      ),)
                    ],),
                  )
                ],),
              ),
            ],),
          ),
          //store recommended end
        ],),),
        bottomNavigationBar: 
         Padding(
            padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Icon(Icons.shopping_cart),
                    onTap: (){},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.orange[500]),borderRadius: BorderRadius.circular(30.0),),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Text("Add To Cart",style: style,),
                      onTap: (){},
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.orange[500]),borderRadius: BorderRadius.circular(30.0),color: Colors.orange[500]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Text("Buy Now",style: style,),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ConfirmOrder()));
                      },
                    ),
                  ),
                ),
              )
            ],),
          )
      ),
    );
  }
}