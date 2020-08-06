
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ypay/Page/DetailsPage.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import '../designUI/TextStyle.dart';
import '../model/userInfo.dart';

class Categories extends StatefulWidget {
  const Categories();
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  String categoryText="";int _selectedIndex;
  TextStyle allstyle=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","");
  TextStyle selectedstyle=TextStylePage.getStyle(UserInfo.currentLocale,"red", "normal","none","");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1100, height: 1334, allowFontScaling: true);
    Widget leftMenuSection;Widget rigthMenuSection;
    
    leftMenuSection=SingleChildScrollView(
      child: Container(
      width: ScreenUtil().setWidth(250),
      child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top:10,bottom: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: InkWell(
            child: Text(AppLocalizations.of(context).translate("choose"),style: TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none",""),),
          onTap: (){
          },),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.orange[500]),
        ),
      ),
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context,i){
          return Padding(
            padding: const EdgeInsets.only(top:3,bottom: 3),
            child: Container(
              padding: const EdgeInsets.only(left:3,top:8,bottom: 8),
              child: InkWell(
                onTap: (){
                setState(() {
                  categoryText=CategoriesItems.items[i];
                  _selectedIndex=i;
                });
              },
                child: Text(CategoriesItems.items[i],
                style: TextStylePage.getStyle(UserInfo.currentLocale,_selectedIndex!=null&&_selectedIndex==i?"red":"black", "normal","none",""),),
              ),
            ),
          );
        },
        itemCount: CategoriesItems.items.length,
      ),
        ],),
        ),
    );

    rigthMenuSection=Expanded(
      child: Container(
       width: ScreenUtil().setWidth(700),
        child: 
        Column(
          children: <Widget>[
            Text(categoryText==null?"":categoryText,style: TextStylePage.getStyle(UserInfo.currentLocale, "black", "header","none",""),),
            Padding(padding: EdgeInsets.only(top:15),),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <CustomListItem>[
                CustomListItem(
                  image: Image(image: AssetImage('images/bulb.jpg'),height: ScreenUtil().setHeight(150),),
                  title: 'High Waist thin denim shorts',
                  pricetext: 'Ks',
                  priceValue: 9800,
                  onpresses: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: SafeArea(child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              leftMenuSection,
              Container(height: ScreenUtil().setHeight(70.0),child: VerticalDivider(color: Colors.grey)),
              rigthMenuSection
            ],),
          ),
        ),
      )),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.image,
    this.title,
    this.pricetext,
    this.priceValue,
    this.onpresses,
  });

  final Image image;
  final String title;
  final String pricetext;
  final double priceValue;
  final GestureTapCallback onpresses;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1000, height: 1000, allowFontScaling: true);
    return Container(
      //width: ScreenUtil().setWidth(900),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      InkWell(onTap: onpresses,child: ClipRRect(child: image,)),
      SizedBox(width: ScreenUtil().setWidth(10),),
      Flexible(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          InkWell(
            onTap: onpresses,
            child: Text(title,style: TextStylePage.getStyle(UserInfo.currentLocale, "black", "normal","none","nobold"),)),
          SizedBox(height: ScreenUtil().setHeight(20),),
          Container(
            width: MediaQuery.of(context).size.width*1/4,
            child: Text(pricetext+","+priceValue.toString(),style: TextStylePage.getStyle(UserInfo.currentLocale, "red", "normal","none",""),)),
          SizedBox(height: ScreenUtil().setHeight(4),),
          Container(
           // width: ScreenUtil().setWidth(250),
           width: MediaQuery.of(context).size.width*1/4,
            child: InkWell(
                child: Row(children: <Widget>[
                Icon(Icons.view_list),
                Padding(padding: EdgeInsets.only(left:5),),
                Text('DHJY',style:TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab","none","")),
                Padding(padding: EdgeInsets.only(left:5),),
                Icon(Icons.keyboard_arrow_right)
              ],),
             onTap: onpresses
            ),
          )
        ],),
      )
    ],
    ),
    ),
   );
  }
}

class CategoriesItems{
  static List<String> items=[
    "Accessories",
    "Lady Wears",
    "Men Wears",
    "Jewellery",
    "Shoes",
    "Accessories",
    "Stationaries",
    "Bags",
    "Catering Services",
    "Electrical Applicances",
    "Books",
    "Stainless Steele",
    "Soaps",
    "Child Wears",
  ];
}