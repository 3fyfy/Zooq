import 'package:flutter/material.dart';

import 'Address.dart';
//component
import 'component/BottomNavPay.dart';
import 'component/AutoText.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count=0;


  @override
  Widget build(BuildContext context) {

Widget _buildListview(){
  return ListView.builder(
      itemCount: 15,
      itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.only(top:5.0,bottom: 5,left: 10,right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey,width: .2),
          borderRadius: BorderRadius.all(Radius.circular(5)),),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10,top: 2,bottom: 2),
              child: Image(image:  AssetImage("images/2.jpg"),width: 50,),
            ),
            Column(
              children: <Widget>[
                AutoText(text:'عطر اجنر اكس' ,size: 15,fontWeight: FontWeight.bold,),
                AutoText(text:"150 ر.س" ,size: 15,color:Theme.of(context).accentColor)
              ],
            ),
//            SizedBox(
//              width: 30,
//            ),
            Container(
              height: 20,
alignment: Alignment.center,
decoration: BoxDecoration(
border: Border.all(color: Colors.blueGrey,width: .2),
borderRadius: BorderRadius.all(Radius.circular(5)),

),
child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
IconButton(icon: Icon(Icons.add,size: 15), onPressed: (){
setState(() {
count=count+1;
});
},
  padding: EdgeInsets.all(0),),

    AutoText(text:"$count" ,size: 15,),

IconButton(icon: Icon(Icons.arrow_downward,size: 15,)
    ,padding: EdgeInsets.all(0),
  onPressed: (){
  setState(() {
    if(count-1>=0)
      count=count-1;


      });
    },),
         ],
        )
      ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
            child: Image(image: AssetImage("images/icon-trash.png"),width: 20,),
          ),
        )
        ]
    )));
  });
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

                Padding(
                    padding: const EdgeInsets.only(top:30,bottom:20,right: 20,left: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height-kToolbarHeight-kBottomNavigationBarHeight-50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: _buildListview(),
                    )
                ),
              ]
          ),
        ],);}


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: AppBar(
          title: AutoText(text:"سلة الشراء" ,size: 20,color: Colors.black,),

          centerTitle: true,
          leading:Image(image:AssetImage('images/icon-logo3.png')) ,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){}),
            IconButton(icon: Icon(Icons.arrow_back_ios,textDirection: TextDirection.ltr
              ,), onPressed: (){Navigator.of(context).pop();}),
          ],
        ),
        body: _buildBody(),

        bottomNavigationBar: BottomNav(Address()),

      ),
    );
  }
}

