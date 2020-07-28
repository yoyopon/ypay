import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ypay/Providers/AppLocalization.dart';
import 'package:ypay/designUI/TextStyle.dart';
import 'package:ypay/model/userInfo.dart';

class ProfilePhotoChange extends StatefulWidget {
  @override
  _ProfilePhotoChangeState createState() => _ProfilePhotoChangeState();
}

class _ProfilePhotoChangeState extends State<ProfilePhotoChange> {
  TextStyle styleWhite=TextStylePage.getStyle(UserInfo.currentLocale,"white", "normal","none","nobold");
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File _image;ImagePicker picker=ImagePicker();

  void takePhoto()async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image=File(pickedFile.path);
    });
    if(_image!=null){
      cropImage(_image);
    }
  }

  void choosePhoto()async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image=File(pickedFile.path);
    });
    if(_image!=null){
      cropImage(_image);
    }
  }

  Future cropImage(File image) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX:300.0,ratioY:150.0),
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      )
    );
    if(croppedFile!=null){
      _image=croppedFile;
     
    }
    _scaffoldKey.currentState.hideCurrentSnackBar();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.of(context).pop();},),
            title: Text(AppLocalizations.of(context).translate("pic"),style: styleWhite,),backgroundColor: Colors.orange[500],),
            body: Container(child: Column(
              children: <Widget>[
              Padding(padding: EdgeInsets.only(top:50),),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*7/10,
                  height: MediaQuery.of(context).size.height*2/5,
                  //decoration: BoxDecoration(border: Border.all(color:Colors.black)),
                  child: Image(image: _image==null?
                    (UserInfo.userInfo.imageUrl==""||UserInfo.userInfo.imageUrl==null?AssetImage('images/bulb.jpg'):NetworkImage(UserInfo.userInfo.imageUrl)):
                    ExactAssetImage(_image.path),
                    fit: BoxFit.fill,  
                  )
                ),
              ),
              Padding(padding: EdgeInsets.only(top:50),),
              RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(AppLocalizations.of(context).translate("changepic"),style: styleWhite,),
                ),
                onPressed: (){
                  final snackBar = SnackBar(
                    duration: Duration(minutes: 10),
                    content: Container(
                      height: MediaQuery.of(context).size.height*1/5,
                      child: Column(children: <Widget>[
                        InkWell(child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 10.0),
                          child: Text(AppLocalizations.of(context).translate("takepic"),style: styleWhite,),
                        ),
                        onTap: (){takePhoto();},
                        ),
                        Divider(color: Colors.white,),
                        InkWell(child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 10.0),
                          child: Text(AppLocalizations.of(context).translate("choosepic"),style: styleWhite,),
                        ),
                        onTap: (){choosePhoto();},
                        ),
                        Divider(color: Colors.white,),
                        InkWell(child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 10.0),
                          child: Text(AppLocalizations.of(context).translate("cancel"),style: styleWhite,),
                        ),
                        onTap: (){_scaffoldKey.currentState.hideCurrentSnackBar();},
                        ),
                      ],),
                    )
                  );

                  _scaffoldKey.currentState.showSnackBar(snackBar);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
                color: Colors.blue[400],
              )
            ],),),
        ),
      ),
    );
  }
}