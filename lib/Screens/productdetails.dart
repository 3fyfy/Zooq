import 'package:flutter/material.dart';

import 'component/carousel.dart';
import 'component/AutoText.dart';
import 'package:share/share.dart';


class Product extends StatefulWidget {
  final String name;
  final String price;
  final String  image;
  final bool favourite;
  final int index ;
  Product({this.name,this.price,this.image,this.index,this.favourite});

  @override
  _ProductState createState() => _ProductState(this.name,this.price,this.image,this.index,this.favourite);
}

class _ProductState extends State<Product> {

  final String name;
  final String price;
  final String  image;
  final bool favourite;
  final int index ;
  _ProductState(this.name,this.price,this.image,this.index,this.favourite);


  Widget _buildTopCarousel(){

    return Padding(
        padding: const EdgeInsets.only(top:30,bottom:0,right: 20,left: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.all(Radius.circular(6))

          ),

          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:10,bottom:0,right: 20,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("$price ر.س",style: TextStyle(fontSize: 15,color:Theme.of(context).accentColor,fontWeight: FontWeight.bold )),
                    Row(
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.share,size: 20,), onPressed: (){
                            Share.share('check out my website https://example.com');
                          },padding: EdgeInsets.all(2),alignment: Alignment.centerLeft,),
                          IconButton(icon: Icon(favourite?Icons.favorite:Icons.favorite_border,color: Theme.of(context).accentColor,size: 20,),padding: EdgeInsets.only(left: 0),onPressed: (){},),
                        ],
                      ),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }


Widget _buildBottomCarousel(){
 return Padding(
    padding: const EdgeInsets.only(top:0,bottom:0,right: 40,left: 40),
    child: Container(
      width:MediaQuery.of(context).size.width-80 ,
      child: Column(

        children: <Widget>[
          Text("$name $name $name $name $name  ",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold ),maxLines: 2,),

          Padding(
            padding: const EdgeInsets.only(top:30,bottom:0,right: 40,left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Row(
                  children: <Widget>[
                    AutoText(text:"الماركة: " ,),
                    AutoText(text:"اجنر",color:Theme.of(context).accentColor,fontWeight: FontWeight.bold ),

                  ],
                ),

                Row(
                  children: <Widget>[
                    AutoText(text:"النوع: " ,),
                    AutoText(text:"5189-رجالي",color:Theme.of(context).accentColor,fontWeight: FontWeight.bold ),

                  ],
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30,bottom:0,right: 40,left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[

                Container(child: AutoText(text:"100% اصلي " )),
                Container(child: AutoText(text:"الدفع عند الاستلام")),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: _buildButton(),
          )
        ],
      ),


    ),
  );
}







  Widget _buildButton(){

    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 2),
      child: InkWell(
          onTap: (){},
          child: Container(
              width: 100,
              height: 28,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  border: Border.all(color: Theme.of(context).accentColor,style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(20))

              ),
              child: Container(
                //width:  (MediaQuery.of(context).size.width/4)-10,

                height: 30,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    border: Border.all(color: Colors.white,style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(20))


                ),
                child: Padding(
                  padding: const EdgeInsets.only(right:3.0,left: 3),
                  child: Center(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(image: AssetImage("images/logo-shopcar.png"),width: 20,),

                          Text("اضف للسلة",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      )),
                ),
              ))),
    );
  }

  Widget _buildBody()
  {
    return ListView(
      children: <Widget>[
        Stack (
          children:<Widget>[

            Container(
                height:MediaQuery.of(context).size.height/2 ,
                color: Theme.of(context).accentColor,

            ),

            _buildTopCarousel(),

            Padding(
              padding: const EdgeInsets.only(top:80.0,right: 20,left: 20),
              child: Container(
                  height:(MediaQuery.of(context).size.height/2)-40 ,
                  child:CarouselImage()
              ),
            ),
            Positioned(
              top:(MediaQuery.of(context).size.height/2)+60 ,
              child:_buildBottomCarousel(),
            )
          ]
        ),



      ],
    );

  }



  @override
  Widget build(BuildContext context) {

//  double width=MediaQuery.of(context).size.width;
//    double height=MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(name,
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


          body:_buildBody()

      ),
    );

  }
}
