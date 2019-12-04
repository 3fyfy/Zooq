import 'package:flutter/material.dart';

import 'package:zooq/Screens/component/ButtonLogin.dart';

import 'package:zooq/Screens/Main Nav Bar/Mainnavbar.dart';
import 'user_controller.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserController userController=UserController();

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

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
              Padding(
              padding: const EdgeInsets.only(top: 20,right: 25,left: 15),
              child: TextFormField(
                  controller:_emailController ,
                  obscureText: false,
                  decoration:_InputDecoration("اسم المستخدم او البريد الالكتروني", "images/icon-username.png"),
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
                      children: <Widget>[
                        InkWell(
                            onTap: (){},
                            child: Text("نسيت كلمة المرور",style: TextStyle(fontSize: 15),))
                      ],
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
                           await userController.loginController(email,password);
                            Navigator.of(context).pushReplacementNamed('/navbar');                          },
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

                                    child: Text("دخول الان",style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ))),
                    )
                  ],
                ),

              ),
                  //ButtonLogin("دخول الان", Mainnavbar()),
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

        ),


        body:_buildBodyLogin()

      ),
    );
  }
}
