import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


//Screens
import 'Screens/Splash.dart';
import 'package:zooq/user/Login.dart';
import 'package:zooq/user/Signup.dart';
import 'package:zooq/Screens/Main Nav Bar/Mainnavbar.dart';
import 'package:zooq/cart/Cart.dart';
import 'categories_products/addproduct.dart';

void main() {

  runApp(
     // DevicePreview(

          //builder: (context) =>
              MaterialApp(

 debugShowCheckedModeBanner: false,
  //home: Splash(),
  theme: ThemeData(
    fontFamily:'cairo' ,
    backgroundColor: Colors.white,
    accentColor:  Color(0xffC01232),
    appBarTheme: AppBarTheme(color: Colors.white,actionsIconTheme: IconThemeData(color:Color(0xffC01232),))
  ),
//home: addproduct(),
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
  //)
  );
}
