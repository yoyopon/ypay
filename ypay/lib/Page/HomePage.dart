import 'package:carousel_slider/carousel_slider.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ypay/Login/CreateAcc.dart';
import 'package:ypay/Login/ResetPassword.dart';
import 'package:ypay/Page/SearchPage.dart';
import 'package:ypay/dataService/Place.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final formKey = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(body: SafeArea(child: ShowList()));
  }

  ///For ShowList
  Widget ShowList() {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          HeaderSlide(),
          SizedBox(height: 5.0),
          _buildSearch(),
          SizedBox(height: 5.0),
          flatButtom(),
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
  Widget HeaderSlide() {
    return Container(
        width: ScreenUtil().setWidth(1100),
        height: ScreenUtil().setHeight(260),
        child: CarouselSlider(
          options: CarouselOptions(autoPlay: true),
          items: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://9to5google.com/wp-content/uploads/sites/4/2018/12/best_android_smartphone_2018.jpg?quality=82&strip=all&w=1600"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Mindfulness",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Mindfulness",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    FlatButton(
                        textColor: Colors.black,
                        highlightColor: Colors.black,
                        splashColor: Colors.blue,
                        color: Colors.blue[400], // <-- this breaks onPressed

                        onPressed: () {},
                        child: Text('Next >'))
                  ],
                ),
              )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://9to5google.com/wp-content/uploads/sites/4/2018/12/best_android_smartphone_2018.jpg?quality=82&strip=all&w=1600"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Mindfulness",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Mindfulness",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      FlatButton(
                          textColor: Colors.black,
                          highlightColor: Colors.black,
                          splashColor: Colors.blue,
                          color: Colors.blue[400], //
                          onPressed: () {},
                          child: Text('Next >'))
                    ],
                  )),
            ),
          ],
        ));
  }

  ///For Search Bar
  Widget _buildSearch() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: ScreenUtil().setWidth(1100),
          height: ScreenUtil().setHeight(100),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_box,
                color: Colors.blue[400],
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                flex: 4,
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    });
                  },
                ),
              ),
              // SizedBox(
              //   width: 10.0,
              // ),
              IconButton(
                  icon: Icon(
                    Icons.filter_center_focus,
                    color: Colors.blue[400],
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      );

  ///For FlatButtom
  Widget flatButtom() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue[300],
          width: ScreenUtil().setWidth(500),
          height: ScreenUtil().setHeight(80),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(130),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text('OK')),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(50.0),
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(110),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text('OK')),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(50.0),
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(110),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text('OK')),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(50.0),
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(110),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text('OK')),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(50.0),
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(110),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text('OK')),
                ),
              ),
            ],
          ),
        ),
      );

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

  imageBoxwithprice() => Container(
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => Card(
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
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      );

  promotionitem() => Container(
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'High',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Commission Area',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Image.network(images[index]),
              ],
            ),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      );
}
