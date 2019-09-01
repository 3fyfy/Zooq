import 'package:flutter/material.dart';


//component
import 'ComponentHome/bghome.dart';
import 'ComponentHome/ListProduct.dart';
import 'ComponentHome/Search.dart';
import '../../component/AutoText.dart';


//screens
import 'package:zooq/Screens/men3tor.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  Widget _buildImageBottom(String image,String title) {
    return Padding(
      padding: const EdgeInsets.only(top:5.0,bottom: 5),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopMen(title)));
        },
        child: Container(
          child: Image(image: AssetImage(image)),
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: ListView(

        children: <Widget>[
          BgHome(),

          Padding(
            padding: const EdgeInsets.only(top:15.0,right: 20,left: 20,bottom: 10),
            child: Search(),
          ),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoText(text:"عطور مميزة" ,size: 20,color:Theme.of(context).accentColor,),

                InkWell(child:
                AutoText(text:"عرض الكل" ,size: 20,),
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopMen("عطور مميزة")));

                },),


              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

      Padding(
        padding: const EdgeInsets.only(right:10.0,left: 10),
         child: Listprod(),
      ),


          SizedBox(
            height: 50,
          ),

          _buildImageBottom('images/bg-Home-men3tor.png',"عطور رجالي"),
          _buildImageBottom("images/bg-Home-women3tor.png","عطور نسائي"),
          _buildImageBottom("images/childimg.png","عطور اطفال")


        ],
      ),
    );
  }
}
