import 'package:flutter/material.dart';

//component
import '../component/GridViewProd.dart';

//Screens


class Favourite extends StatefulWidget {

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {


  @override
  Widget build(BuildContext context) {

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("المفضلة",
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
              },)

            ],
          ),

          body:GridViewProd()

        )

    );
  }
}
