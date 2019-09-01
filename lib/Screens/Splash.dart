import 'package:flutter/material.dart';
import 'dart:async';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushReplacementNamed('/navbar'));
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        //color:Theme.of(context).accentColor,
        image: DecorationImage(image: AssetImage("images/logobg.jpg"),fit: BoxFit.cover)


      ),
      child: Center(
        child: Image(image: AssetImage('images/logo-zooq.png'),width: 130,),
      ),
    );
  }
}
