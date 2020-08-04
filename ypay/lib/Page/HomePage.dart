import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ypay/Login/ResetPassword.dart';
import 'package:ypay/Page/DetailsPage.dart';
import 'package:ypay/Page/searchItems.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/Place.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
import 'dart:typed_data';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final formKey = new GlobalKey<State>();
  TextStyle styleGrey=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "normal","none","nobold");
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","bold");
  TextEditingController _searchtext = new TextEditingController();
  Uint8List bytes = Uint8List(0);

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    //ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    ScreenUtil.init(width: 1100, height: 1334, allowFontScaling: true);
    return MaterialApp(home: SafeArea(
      child:Scaffold (body:
      ShowList()
    )));
  }

  ///For ShowList
  Widget ShowList() {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
         headerSlide(),
          SizedBox(height: 5.0),
          _buildSearch(),
          SizedBox(height: 5.0),
          fltbuttons(),
          SizedBox(height: 5.0),
          //imageBox(),
          promotionitem(),
          SizedBox(height: 10.0),
          imageBoxwithprice(),
          SizedBox(height: 10.0),

          //Text('OK')
        ],
      ),
    );
  }

  ///For Header Slide Bar
  final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];//int _current = 0;
  Widget headerSlide(){
    return Container(
      height: MediaQuery.of(context).size.height*1/4,
      child: 
      CarouselSlider(
        items:imgList.map((item)=>Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image:DecorationImage(
                image: NetworkImage(item),fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Text("Clothing",style: styleWhite,),
              Container(
                padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 10.0),
                decoration: BoxDecoration(color: Colors.orange[500]),
                child: InkWell(child: Text("View Detail >>",style: styleWhite,),onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                },),
              )
            ],),
          ),)).toList(),
        options: CarouselOptions(
          onPageChanged: (i,index){
            
          }
        ),
      ),
    );
  }

  ///For Search Bar
  Widget _buildSearch() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: ScreenUtil().setWidth(1100),
          height: ScreenUtil().setHeight(100),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 4,
                child: TextFormField(
                  controller: _searchtext,
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: AppLocalizations.of(context).translate("search"),
                    hintStyle: styleGrey,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => SearchItems()));
                  },
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.filter_center_focus,
                    color: Colors.orange[500],
                  ),
                  onPressed: () {
                    _scan();
                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                  })
            ],
          ),
        ),
      );
      ///For Scan
  Future _scan() async {
    String barcode = await scanner.scan();
    this._searchtext.text = barcode;
  }
  // Future _scanPhoto() async {
  //   String barcode = await scanner.scanPhoto();
  //   this._searchtext.text = barcode;
  // }
  // Future _scanPath(String path) async {
  //   String barcode = await scanner.scanPath(path);
  //   this._searchtext.text = barcode;
  // }
    List<String> keywords=["Clothing","Cosmetics","Stationaries","Shoes","Baby Wears","Steele","Electrical Devices"];
    Widget getTextWidgets()
    {
      List<Widget> list = new List<Widget>();
      for(var i = 0; i < keywords.length; i++){
          list.add(
            Padding(padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
                    padding: EdgeInsets.all(7.0),
                    child: Text(keywords[i],style: TextStyle(color: Colors.grey),),
                ),
                onTap: (){},
              ),
            )
          );
      }
      return new Row(children: list); 
    }
    Widget fltbuttons(){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Row(children: <Widget>[
          getTextWidgets()
        ],)
      );
    }

  ///For Image Box
  List wonders = [
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "Taj Mahal",
        country: "India"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Christ-the-Redeemer.jpg",
        name: "Christ the Redeemer",
        country: "Brazil"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2016/03/petra-jordan9.jpg",
        name: "Petra",
        country: "Jordan"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Great-Wall-of-China-view.jpg",
        name: "The Great Wall of China",
        country: "China"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/View-of-the-Colosseum.jpg",
        name: "The Colosseum",
        country: "Rome"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Machu-Picchu-around-sunset.jpg",
        name: "Machu Picchu",
        country: "Peru"),
  ];

  ///For imageBox Design
  imageBox() => Container(
        width: ScreenUtil().setWidth(1000),
        child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(), //// to disable GridView's scrolling
          itemCount: wonders.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return CupertinoButton(
                child: Container(
                  child: Card(
                      child: Column(
                    children: <Widget>[
                      Text(wonders[index].name),
                      Text(wonders[index].country),
                      Container(
                          width: ScreenUtil().setWidth(500),
                          child: Image.network(
                            wonders[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                          height: 120),
                    ],
                  )),
                ),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Card is clicked.'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Text('ok'),
                          onPressed: () {
                            Navigator.pop(context, 'ok');
                          },
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      );

  final List<String> images = [
    "https://9to5google.com/wp-content/uploads/sites/4/2018/12/best_android_smartphone_2018.jpg?quality=82&strip=all&w=1600",
    "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
    "https://www.boostmobile.com/content/dam/boostmobile/en/products/phones/apple/iphone-7/silver/device-front.png.transform/pdpCarousel/image.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
    "https://ae01.alicdn.com/kf/HTB11tA5aiAKL1JjSZFoq6ygCFXaw/Unlocked-Samsung-GALAXY-S2-I9100-Mobile-Phone-Android-Wi-Fi-GPS-8-0MP-camera-Core-4.jpg_640x640.jpg",
    "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
    "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/images/16q1/665019/2016-chevrolet-silverado-2500hd-high-country-diesel-test-review-car-and-driver-photo-665520-s-original.jpg",
    "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
    "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
    "https://media.onthemarket.com/properties/6191840/797152761/composite.jpg",
  ];

///For Image Box With Price
  imageBoxwithprice() => new StaggeredGridView.countBuilder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    
    crossAxisCount: 4,
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) => CupertinoButton(
                child: Container(
        child: Card(
          child: Column(
            children: <Widget>[
              Image.network(images[index]),
              Text("Baby Wipes Paper Towels Special 10 packs"),
              Text(
                'Ks 7700',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                'Ks 8800',
                style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
        ),
        
      ),
      onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Card is clicked.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('ok'),
                    onPressed: () {
                      Navigator.pop(context, 'ok');
                    },
                  ),
                ],
              ),
            );
          }
    ),
    staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  );
///For Promotion Item
  promotionitem() => Container(

    
        child: StaggeredGridView.countBuilder(
          
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => CupertinoButton(
                      child: Container(
              child: Card(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                          'High Commission Area',
                          //style: TextStyle(color: Colors.red),
                        ),
                    Image.network(images[index]),
                  ],
                ),
              ),
            ),
            onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Card is clicked.'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Text('ok'),
                          onPressed: () {
                            Navigator.pop(context, 'ok');
                          },
                        ),
                      ],
                    ),
                  );
                }
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      );
}
