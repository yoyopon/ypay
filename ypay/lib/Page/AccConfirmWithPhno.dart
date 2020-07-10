import 'package:flutter/material.dart';
import 'package:ypay/Login_AbstractClass/LoginStoreImplement.dart';

class  PhoneAuth extends StatefulWidget{
  PhoneAuthState createState()=>PhoneAuthState();
}

class PhoneAuthState extends State<PhoneAuth> {

  final formKey=new GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor:Colors.green ,
          title:  Text("Phone Authentication",style: TextStyle(color:Colors.white,fontFamily: "EucrosiaUPC",fontSize: 30)
          ),
        ),
        body: Center(
          child:Padding(
            padding: const EdgeInsets.all(35.0),
            child: Form(
              key: formKey,
              child: ShowList(),
            ),
          ),
        ),
      ),
    );
  }

  ///For ShowList
  Widget ShowList()
  {
    return ListView(
      children: <Widget>[
        MobileText(),
        SizedBox(height: 30.0),
        PhoneNumber(),
//        (errorMessage != ''
//            ? Text(
//          errorMessage,
//          style: TextStyle(color: Colors.red),
//        )
//            : Container()),
        SizedBox(height: 50.0),
        NextButtom()
      ],
    );
  }

  ///For Mobile Text
  Widget MobileText()
  {
    return Container(
      child:  Text('Enter Mobile Number to confirm your account',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 30,
          fontFamily: 'EucrosiaUPC',
        ),),

    );
  }

  ///For Phone Number TextBox
  Widget PhoneNumber(){
    return Container(
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        validator: (value){
          if(value.isEmpty){
            return 'Enter your Phone Number!';
          }
          if (value.length < 6) {
            return 'Must be at least six charaters!';
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone,color: Colors.green),
            prefixText: '09  ',
            prefixStyle: TextStyle(color: Colors.black,fontFamily: "Roboto Slab Regular",fontSize: 15.5),
            hintText: "Phone Number",
            hintStyle: TextStyle(color: Colors.grey,fontFamily: "Roboto Slab Regular"),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            )
        ),
        onChanged: (value) {
          //this.phoneNo = '+959'+value;
        },
      ),
    );
  }

  ///For Next Buttom
  Widget NextButtom(){
    return Container(
      child: RaisedButton(
        color: Color(0xff4AB055),
        onPressed: (){
          //Navigator.pushReplacement(context, MaterialPageRoute( builder: (context)=>const OtpPage()));
          if(formKey.currentState.validate()){
            if(phoneController.text.isNotEmpty)
            {
              LoginStore loginStore=new LoginStore();
              final String phoneNo='+959'+phoneController.text.toString();
              loginStore.getCodeWithPhoneNumber(context, phoneNo);
            }
          }
        },
        child: Text('Next',
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'EucrosiaUPC',
              color: Colors.white
          ),),
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ) ,
    );
  }

}