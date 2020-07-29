import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ypay/Page/Categories.dart';
import 'package:ypay/Page/DetailsPage.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItems extends StatefulWidget {
  @override
  _SearchItemsState createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {

  TextEditingController searchItemsController=TextEditingController();
  bool isVisible = false;
  TextStyle styleGrey=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "bottomtab","none","nobold");
  TextStyle styleBlack=TextStylePage.getStyle(UserInfo.currentLocale,"black", "normal","none","nobold");
  String dropdownValue="All";
  List<String> dropdownItems1=["All","One","Two","Three","Four"];
  List<CustomListItem> resultLists=[];
  List<CustomListItem> sortList=[];
  List<CustomListItem> searchResult=[];
  bool sort=false;

  @override
  void initState() {
    super.initState();
    searchItemsController.addListener((){
      setState(() {
        isVisible=searchItemsController.text.length>0?true:false;
      });
    });
  }
  TextStyle style=TextStylePage.getStyle(UserInfo.currentLocale,"black", "bottomtab","none","nobold");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchSectionHeader(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: optionArea(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: itemsLists(),
          )
        ],)
      ),),
    );
  }

  Widget searchSectionHeader(){
    return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Container(
              //height: 40.0,
              width: MediaQuery.of(context).size.width*3/4,
              child: TextField(
                autofocus: true,
                controller: searchItemsController,
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.search,color: Colors.grey,),
                  suffixIcon: Visibility(
                    visible: isVisible,
                    child: IconButton(icon:Icon(Icons.cancel,color: Colors.blueGrey,),onPressed: (){
                      searchItemsController.clear();searchItem('');
                    },),
                  ) ,
                  hintText: AppLocalizations.of(context).translate("search"),
                  hintStyle: styleGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10.0)),borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.blue[400]),
                  ),
                ),
                onSubmitted: (value){
                  searchItem(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15,left: 10),
              child: Container(
                height: 20,
                child: InkWell(
                  child: Text(AppLocalizations.of(context).translate("cancel"),style: styleBlack,),
                  onTap: (){Navigator.of(context).pop();},
                ),
              ),
            )
          ],),
        );
  }

  searchItem(String text)async{
    searchResult.clear();
    if(text.isEmpty){
      setState(() {
        
      });
      return;
    }else{
      resultLists.forEach((item){
        if(item.title.contains(text)){
          searchResult.add(item);
        }
      });
    }
  }

  Widget optionArea(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            style: style,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: dropdownItems1.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Container(
            child: InkWell(child: Text("Sale",style: style,),onTap: (){},),
          ),
          Container(
            child: Row(children: <Widget>[
              Text("Price",style: style,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                InkWell(child: Icon(Icons.arrow_drop_up),onTap: (){
                  setState(() {
                    sort=true;
                  });
                  sortByMax();},),
                InkWell(child: Icon(Icons.arrow_drop_down),onTap: (){
                  setState(() {
                    sort=true;
                  });
                  sortByMin();},)
              ],)
            ],),
          ),
          Container(
            child: InkWell(child: Row(
              children: <Widget>[
                Text("Filter",style: style,),Icon(Icons.filter_list)
              ],
            ),onTap: (){},),
          ),
          Container(
            child: InkWell(child: Icon(Icons.menu),onTap: (){},),
          ),
      ],),
    );
  }

  sortByMax()async{
    resultLists.sort((a, b) => a.priceValue.compareTo(b.priceValue));
    for (var item in resultLists) {
      print(item.priceValue.toString());
    }
    sortList=resultLists;
    setState(() {
      
    });
  }

  sortByMin()async{
    resultLists.sort((a, b) => a.priceValue.compareTo(b.priceValue));
    sortList=resultLists.reversed.toList();
    for (var item in sortList) {
      print(item.priceValue.toString());
    }
    setState(() {
      
    });
  }

  Widget itemsLists(){
    onpress(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
    }
    resultLists=[
    new CustomListItem(
      image: Image(image: AssetImage('images/bulb.jpg'),height: ScreenUtil().setHeight(150),),
      title: '1 High Waist thin denim shorts',
      pricetext: 'Ks',
      priceValue: 9800,
      onpresses: onpress,
    ),
    new CustomListItem(
      image: Image(image: AssetImage('images/bulb.jpg'),height: ScreenUtil().setHeight(150),),
      title: '2 Point Shoe Wore By Kendall',
      pricetext: 'Ks',
      priceValue: 10000,
      onpresses: onpress,
    ),
    new CustomListItem(
      image: Image(image: AssetImage('images/bulb.jpg'),height: ScreenUtil().setHeight(150),),
      title: '3 Long Sleeve long dreeses For ladies',
      pricetext: 'Ks',
      priceValue: 8900,
      onpresses: onpress,
    ),
  ];
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    return 
    sort==true?
    ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: sortList.length,
      itemBuilder: (context,i){
        return CustomListItem(
          image: sortList[i].image,
          title: sortList[i].title,
          pricetext: sortList[i].pricetext,
          priceValue: sortList[i].priceValue,
          onpresses: sortList[i].onpresses,
        );
      }
    )
    :
    searchResult.length!=0||searchItemsController.text.isNotEmpty?
    ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: searchResult.length,
      itemBuilder: (context,i){
        return CustomListItem(
          image: searchResult[i].image,
          title: searchResult[i].title,
          pricetext: searchResult[i].pricetext,
          priceValue: searchResult[i].priceValue,
          onpresses: searchResult[i].onpresses,
        );
      }
    ):
    ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: resultLists.length,
      itemBuilder: (context,i){
        return CustomListItem(
          image: resultLists[i].image,
          title: resultLists[i].title,
          pricetext: resultLists[i].pricetext,
          priceValue: resultLists[i].priceValue,
          onpresses: resultLists[i].onpresses,
        );
      }
    );
  }
}