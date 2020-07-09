import 'package:flutter/material.dart';
import 'package:ypay/designUI/MessageHandel.dart';
import 'package:ypay/Page/LoginPage.dart';
import 'package:ypay/dataService/userProfilePresenter.dart';
import 'package:ypay/model/userInfo.dart';

class UserProfile extends StatefulWidget {
  UserInfo userInfo;
  UserProfile(this.userInfo):super();
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with UserProfileContract{
  UserProfilePresenter _presenter;

  @override
  void initState() {
    _presenter=new UserProfilePresenter(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile"),backgroundColor: Colors.green,),
      body: ListView(

        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top:5.0,bottom: 10.0,left: 10.0),
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                widget.userInfo.imageUrl==""?Container(child: Text("Image"),):
                Container(
                  width: 70.0,
                  height: 70.0,
                  child: ClipRRect(
                    child: Image(image: NetworkImage(widget.userInfo.imageUrl),),
                    borderRadius: BorderRadius.circular(60.0),
                    ),
                ),
                Padding(padding: EdgeInsets.only(left:15.0),),
                Column(
                  children: <Widget>[
                    Text("${widget.userInfo.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("${widget.userInfo.email}",),
                  ],
                )
              ],
            ),
          ),
          Divider(height: 0.0,color: Colors.grey.withOpacity(0.5),),

          InkWell(
             onTap: (){  },
             child: new Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 20.0,right: 10.0,top: 15.0 ,bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(child:
                          Row(
                            children: <Widget>[
                              Icon(Icons.edit,color: Colors.blueGrey,),
                              Container(padding: EdgeInsets.only(left: 10.0), child: Text("Edit Phone Number",style:Theme.of(context).textTheme.body2,)),
                            ],
                          ),),
                        ],
                      ),
                    ),
           ),

          Divider(height: 0.0,color: Colors.grey.withOpacity(0.5),),

          InkWell(
             onTap: (){   
                        if(widget.userInfo.loginWith=="facebook"){
                        _presenter.signOutFromFacebook();
                      }
                      if(widget.userInfo.loginWith=="google"){
                        _presenter.signOutFromGoogle();
                      }
                    },
             child: new Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 20.0,right: 10.0,top: 15.0 ,bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(child:
                          Row(
                            children: <Widget>[
                              Icon(Icons.exit_to_app,color: Colors.green,),
                              Container(padding: EdgeInsets.only(left: 10.0), child: Text("Logout",style:Theme.of(context).textTheme.body2,)),
                            ],
                          ),),
                        ],
                      ),
                    ),
           ),

          
        ],
      ),
    );
  }

  @override
  void logOutSuccess() {
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  @override
  void showError(String msg) {
    MessageHandel.showError(context, "", msg);
  }

  @override
  void showMessage() {
    // TODO: implement showMessage
  }

}