import 'package:flutter/material.dart';

import '../component/ButtonLogin.dart';
import 'package:zooq/Screens/Main Nav Bar/Mainnavbar.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  Widget _buildTextField(String hintText,String icon,bool secure)
  {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 25,left: 15),
      child: TextFormField(
        obscureText: secure,

        decoration: InputDecoration(
            hintText: hintText,

            border:UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,)),

            //OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none,color: Colors.white)),
            hintStyle: TextStyle(fontSize: 16),
            prefixIcon: Image(image: AssetImage(icon))),
      ),
    );
  }


  @override

  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("التسجيل",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,

            ),),
          centerTitle: true,
          leading:Image(image:AssetImage('images/icon-logo3.png')) ,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){
              Navigator.of(context).pushNamed('/cart');
            }),
            IconButton(icon: Icon(Icons.arrow_back_ios,textDirection: TextDirection.ltr
              ,), onPressed: (){
              Navigator.of(context).pop();
            }),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              color: Theme.of(context).accentColor,

              child: Padding(
                padding: const EdgeInsets.only(top:30,bottom:120,right: 20,left: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(6))

                  ),
                  child: ListView(
                    children: <Widget>[
                      _buildTextField("اسم المستخدم ", "images/icon-username.png", false),
                      _buildTextField(" البريد الالكتروني", "images/icon-email.png", false),

                      _buildTextField("كلمة المرور", "images/icon-password.png", true),
                      _buildTextField("تاكيد كلمة المرور", "images/icon-password.png", true),


                      ButtonLogin("تسجيل", Mainnavbar())


                    ],
                  ),

                ),
              ),
            )
          ],
        ),

      ),
    );
  }

}
