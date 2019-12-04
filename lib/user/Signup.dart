import 'package:flutter/material.dart';

import '../Screens/component/ButtonLogin.dart';
import 'package:zooq/Screens/Main Nav Bar/Mainnavbar.dart';
import 'user_controller.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  UserController userController=UserController();

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }


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
  _InputDecoration(String hintText,String icon)
  {
    return InputDecoration(
      hintText: hintText,

      border:UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,)),
      hintStyle: TextStyle(fontSize: 16),
      prefixIcon: Image(image: AssetImage(icon)),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).accentColor),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20,right: 25,left: 15),
                        child: TextFormField(
                          controller:_emailController ,
                          obscureText: false,
                          decoration:_InputDecoration(" البريد الالكتروني", "images/icon-email.png"),
                          cursorColor: Theme.of(context).accentColor,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20,right: 25,left: 15),
                        child: TextFormField(
                          controller:_passwordController ,
                          obscureText: true,
                          decoration:_InputDecoration("كلمة المرور", "images/icon-password.png"),
                          cursorColor: Theme.of(context).accentColor,
                        ),
                      ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10,right: 25,left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: InkWell(
                              onTap: ()async{

                              String  email=_emailController.text;
                              String  password=  _passwordController.text;
                              userController.registerController(email, password);
                              Navigator.of(context).pushReplacementNamed('/navbar');                              },
                              child: Container(
                                  width: 140,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      border: Border.all(color: Theme.of(context).accentColor,style: BorderStyle.solid),
                                      borderRadius: BorderRadius.all(Radius.circular(50))

                                  ),
                                  child: Container(
                                    width: 130,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        border: Border.all(color: Colors.white,style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(Radius.circular(50))


                                    ),
                                    child: Center(

                                        child: Text("تسجيل",style: TextStyle(fontSize: 20,color: Colors.white),)),
                                  ))),
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
        ),

      ),
    );
  }

}
