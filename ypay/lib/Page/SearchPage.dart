import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ypay/Login/ResetPassword.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    search.addListener(() {
      setState(() {
        isVisible = search.text.length > 0 ? true : false;
      });
    });
    super.initState();
  }

  bool isVisible = false;
  final formKey = new GlobalKey<FormState>();
  TextEditingController search = new TextEditingController();
  String value = "";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1000, height: 1334, allowFontScaling: true);
    TextStyle styleGrey=TextStylePage.getStyle(UserInfo.currentLocale,"grey", "normal","none","nobold");
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: ScreenUtil().setWidth(1000),
                  height: ScreenUtil().setHeight(100),
                  child: Row(
                    children: <Widget>[
                      new Flexible(
                        child: TextField(
                          controller: search,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            suffixIcon: Visibility(
                              visible: isVisible,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    search.clear();
                                  }),
                            ),
                            hintText: AppLocalizations.of(context).translate("search"),
                            hintStyle: styleGrey,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(200),
                        height: ScreenUtil().setHeight(100),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.5),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontFamily: "Roboto Slab Regular",
                                    fontSize: 15.0,
                                    color: Colors.black54),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                width: ScreenUtil().setWidth(1000),
                height: ScreenUtil().setHeight(100),
                child: Row(
                  children: <Widget>[
                    normalDropDown(),
                    SizedBox(
                      width: ScreenUtil().setWidth(80),
                    ),
                    Sales(),
                    SizedBox(
                      width: ScreenUtil().setWidth(80),
                    ),
                    Price(),
                    SizedBox(
                      width: ScreenUtil().setWidth(80),
                    ),
                    Filters(),
                    SizedBox(
                      width: ScreenUtil().setWidth(80),
                    ),
                    Menu()
                  ],
                ),
              ),
              InfoList(),
            ],
          ),
        ),
      ),
    );
  }

  ///For DropDown Buttom
  String dropdownValue = 'All';
  normalDropDown() => Container(
        //sssssssssswidth: ScreenUtil().setWidth(105),
        height: 36,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            style: TextStyle(color: Colors.black),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['All', 'One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );

  ///For Sales Buttom
  Sales() => Container(
        //width: ScreenUtil().setWidth(105),
        height: 36,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            hoverColor: Colors.red,
            child: Text('Sales'),
            onTap: () {},
          ),
        ),
      );

  ///For Price Box
  Price() => Container(
        //width: ScreenUtil().setWidth(105),
        height: 36,
        color: Colors.grey[200],
        child: Row(
          children: <Widget>[
            Text('Price'),
            Column(
              children: <Widget>[
                InkWell(
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 18.0,
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 18.0,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      );

  ///For Filters Buttom
  Filters() => Container(
        //width: ScreenUtil().setWidth(105),
        height: 36,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            hoverColor: Colors.red,
            child: Text('Filters'),
            onTap: () {},
          ),
        ),
      );

  ///For Menu Buttom
  Menu() => Container(
        //width: ScreenUtil().setWidth(105),
        color: Colors.grey[200],
        height: 36,
        child: InkWell(
            child: Icon(Icons.menu),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ResetPassword()));
            }),
      );

  ///For InformationList
  InfoList() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: Container(
                width: 150,
                height: 100,
                child: Image.asset('images/bulb.jpg'),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(5),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Korean Small Pudding Cleaning Mask'),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Text(
                    'Ks 3600',
                    style: TextStyle(color: Colors.red, fontSize: 30),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(4),
                  ),
                  Container(
                    //width: ScreenUtil().setWidth(300),
                    child: InkWell(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.view_list),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Text(
                            'Love is beautiful',
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                      onTap: () {
                        // Navigator.push(context,
                        //   MaterialPageRoute(builder: (BuildContext context)=>DetailsPage())
                        // );
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new ResetPassword();
                        }));
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
