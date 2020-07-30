import 'dart:async';
import 'dart:io' as io;
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ypay/model/userInfo.dart';

class DBHelper {
    static Database _db;

    Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
    "CREATE TABLE UserInfo(id INTEGER PRIMARY KEY, name TEXT, email TEXT, imageUrl TEXT,msg TEXT ,loginWith TEXT,phone TEXT )");
    print("Created table");
  }

  // Retrieving employees from Employee Tables
  Future<UserInfo> getUserInfo() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM UserInfo');
    UserInfo userInfo = new UserInfo();
    if(list.length>0){
      userInfo.name=list[0]["name"];
      userInfo.email=list[0]["email"];
      userInfo.imageUrl=list[0]["imageUrl"];
      if(userInfo.imageUrl.contains("file")||userInfo.imageUrl.contains("File")){
        int fIndex=userInfo.imageUrl.indexOf('/');
        int lIndex=userInfo.imageUrl.lastIndexOf("'");
        String filePath=userInfo.imageUrl.substring(fIndex,lIndex);
        UserInfo.fileImage=File(filePath);
      }
      userInfo.msg=list[0]["msg"];
      userInfo.loginWith=list[0]["loginWith"];
      userInfo.phone=list[0]["phone"];
      if(userInfo.name==""||userInfo.email==""||userInfo.imageUrl==""||userInfo.msg==""||userInfo.loginWith==""||userInfo.phone==""){
        String sql="Delete From UserInfo";
        await dbClient.execute(sql);
        print(list.length.toString());
        return null;
      }
      else{
        print(userInfo.name);
        print(list.length.toString());
        return userInfo;
      } 
    }
    else{
      return null;
    }
  }

  Future<bool> updatePhoneNumber(UserInfo info,String phone)async{
    try{
      var dbClient = await db;
      String sql="Select * from UserInfo where email='${info.email}'";
      List<Map>  list = await dbClient.rawQuery(sql);
      if(list.length>0){
        int res=await dbClient.rawUpdate("update UserInfo set phone=?",['$phone']);
          return res>0?true:false;
      }
    }catch(ex){
      return null;
    }

  }

  Future<bool> updatePhoto(UserInfo info,File image)async{
    try{
      var dbClient = await db;
      String sql="Select * from UserInfo where email='${info.email}'";
      List<Map>  list = await dbClient.rawQuery(sql);
      if(list.length>0){
        int res=await dbClient.rawUpdate("update UserInfo set imageUrl=?",['$image']);
          return res>0?true:false;
      }
    }catch(ex){
      return null;
    }

  }


  void saveUserInfo(UserInfo info) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO UserInfo(name, email, imageUrl, msg, loginWith,phone) VALUES(' +
              '\'' +
              info.name +'\'' +',' +'\'' +
              info.email+'\'' +',' +'\'' +
              info.imageUrl +'\'' +',' +'\'' +
              info.msg +'\'' +',' +'\'' +
              info.loginWith +'\'' +',' +'\'' +
              info.phone +'\'' +')');
    });
    print("Save user");
  }

  Future<bool> deleteUserInfo() async{
    try{
      var dbClient = await db;
      String sql="Delete From UserInfo";
      await dbClient.execute(sql);
      print("delete success");
      return true;
    }catch(ex){
      return false;
    }
  }

  

}