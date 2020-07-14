import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ypay/Login/ResetPassword.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Search",
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onTap: () {
                // setState(() {
                //   Navigator.pop(context);
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: (context) => SearchPage()));
                // });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 36,
                    color: Colors.grey[200],
                    child: normalDropDown(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    color: Colors.grey[200],
                    onPressed: () {},
                    child: Text('Sales'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Price(),
                  FlatButton(
                    color: Colors.grey[200],
                    onPressed: () {},
                    child: Text('Filters'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: 30,
                    height: 36,
                    child: InkWell(
                        child: Icon(Icons.menu),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword()));
                        }),
                  )
                ],
              ),
            ),
            InfoList(),
          ],
        ),
      ),
    );
  }

  String dropdownValue = 'All';
  normalDropDown() => DropdownButton<String>(
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
      );

  ///For Price Box
  Price() => Container(
        width: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              height: 36,
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Price'),
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 37.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_drop_up,
                        size: 18.0,
                      ),
                      onTap: () {
                        //int currentValue = int.parse(_controller.text);
                        setState(() {
                          // currentValue++;
                          // _controller.text =
                          //     (currentValue).toString(); // incrementing value
                        });
                      },
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 18.0,
                    ),
                    onTap: () {
                      //int currentValue = int.parse(_controller.text);
                      setState(() {
                        // print("Setting state");
                        // currentValue--;
                        // _controller.text = (currentValue > 0 ? currentValue : 0)
                        //     .toString(); // decrementing value
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
