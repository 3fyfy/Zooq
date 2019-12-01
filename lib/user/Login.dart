import 'package:flutter/material.dart';

import '../component/ButtonLogin.dart';

import 'package:zooq/Screens/Main Nav Bar/Mainnavbar.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
            prefixIcon: Image(image: AssetImage(icon)),
       ),

        cursorColor: Theme.of(context).accentColor,

      ),
    );
  }


  Widget _buildBodyLogin(){
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
  return  ListView(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          color: Theme.of(context).accentColor,

          child: Padding(
            padding: const EdgeInsets.only(top:30,bottom:120,right: 20,left: 20),
            child: Container(
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.all(Radius.circular(6))

              ),
              child: ListView(
                children: <Widget>[
                  _buildTextField("اسم المستخدم او البريد الالكتروني", "images/icon-username.png", false),
                  _buildTextField("كلمة المرور", "images/icon-password.png", true),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,right: 25,left: 15),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                            onTap: (){},
                            child: Text("نسيت كلمة المرور",style: TextStyle(fontSize: 15),))
                      ],
                    ),

                  ),
                  ButtonLogin("دخول الان", Mainnavbar()),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("لا امتلك حساب",style: TextStyle(fontSize: 15),),

                        SizedBox(
                          width: 10,
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Text("سجل الان",style: TextStyle(fontSize: 15,color: Theme.of(context).accentColor),),
                        )

                      ],
                    ),
                  )

                ],
              ),

            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تسجيل الدخول",
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
              ,), onPressed: (){  Navigator.pop(context);
            }),
          ],
        ),


        body:_buildBodyLogin()

      ),
    );
  }
}
