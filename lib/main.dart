import 'package:flutter/material.dart';


//Screens
import 'Screens/Splash.dart';
import 'package:zooq/Screens/Main Nav Bar/Login.dart';
import 'package:zooq/Screens/Main Nav Bar/Signup.dart';
import 'package:zooq/Screens/Main Nav Bar/Mainnavbar.dart';
import 'Screens/Cart.dart';


void main() {
  runApp(
MaterialApp(
 debugShowCheckedModeBanner: false,
  //home: Splash(),
  theme: ThemeData(
    fontFamily:'cairo' ,
    backgroundColor: Colors.white,
    accentColor:  Color(0xffC01232),
    appBarTheme: AppBarTheme(color: Colors.white,actionsIconTheme: IconThemeData(color:Color(0xffC01232),))
  ),

  initialRoute: '/',
  routes: {
    '/':(BuildContext context)=> Splash(),
    '/login': (BuildContext context) => Login(),
    '/signup': (BuildContext context) => Signup(),
    '/navbar': (BuildContext context) => Mainnavbar(),
    '/cart': (BuildContext context) => Cart(),

    //'/home':(BuildContext context) => Home(),

  }
)
  );
}