// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:ypay/model/userInfo.dart';

// class LoginRepostory{
//   BuildContext context;
//   LoginRepostory(this.context);
//   var facebookLogin = FacebookLogin();
//   GoogleSignIn _googleSignIn=GoogleSignIn();

//   Future<UserInfo> initiateFacebookLogin() async {
//     UserInfo fbData=new UserInfo();
//     var facebookLoginResult =
//         await facebookLogin.logIn(['email']);
//       facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
//      switch (facebookLoginResult.status) {
//       case FacebookLoginStatus.error:
//         fbData.email=fbData.imageUrl=fbData.name=fbData.loginWith="";
//         fbData.msg="Login Error";
//         break;

//       case FacebookLoginStatus.cancelledByUser:
//         fbData.email=fbData.imageUrl=fbData.name=fbData.loginWith="";
//         fbData.msg="Login Cancelled By User";
//         break;
//       case FacebookLoginStatus.loggedIn:
//         var graphResponse = await http.get(
//         'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),email&access_token=${facebookLoginResult
//         .accessToken.token}');

//         var profile = json.decode(graphResponse.body);
//         print(profile.toString());
//         fbData.name=profile["name"].toString();
//         fbData.email=profile["email"].toString();
//         fbData.imageUrl=profile['picture']['data']['url'].toString();
//         fbData.msg="Login Success";
//         fbData.loginWith="facebook";
//         break;
//     }
//     return fbData;
//   }

//   Future<bool> fbSignOut() async{
//     await facebookLogin.logOut();
//   }

//   Future<UserInfo> googleSignin() async{
//     UserInfo info=new UserInfo();
//     _googleSignIn = GoogleSignIn(scopes: ['email']);
//     try{
//       await _googleSignIn.signIn(); 
//       info.name=_googleSignIn.currentUser.displayName;
//       info.email=_googleSignIn.currentUser.email;
//       info.imageUrl=_googleSignIn.currentUser.photoUrl;
//       info.msg="Login Success";
//       info.loginWith="google";
//     }catch(e){
//       info.name=info.email=info.imageUrl=info.loginWith="";
//       info.msg=e.toString();
//       print(e.toString());
//     }
//     return info;
//   }

//   Future<bool> googleSingout() async{
//    await _googleSignIn.signOut();
//   }

// }