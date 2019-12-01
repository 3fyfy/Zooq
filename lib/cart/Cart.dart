import 'package:flutter/material.dart';

import 'Address.dart';
//component
import 'component/BottomNavPay.dart';
import 'component/AutoText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Cart extends StatefulWidget {
  static double totalPrice=0;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count=0;


  @override
  Widget build(BuildContext context) {
Widget _buildListview() {
  return StreamBuilder(
      stream: Firestore.instance.collection('Cart').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5, left: 10, right: 10),
               child: Container(
                   child: Text('Loading...')));
          default:
            return ListView(
              children: snapshot.data.documents.map((
                  DocumentSnapshot document) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5, left: 10, right: 10),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: .2),
                          borderRadius: BorderRadius.all(Radius.circular(5)),),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 10, top: 2, bottom: 2),
                                child: Image(
                                  image: NetworkImage(document['images'][2]),
                                  width: 50,),
                              ),
                              Column(
                                children: <Widget>[
                                  AutoText(text: document['title'],
                                    size: 15,
                                    fontWeight: FontWeight.bold,),
                                  AutoText(
                                      text: "${document['total_price']} ر.س",
                                      size: 15,
                                      color: Theme
                                          .of(context)
                                          .accentColor)
                                ],
                              ),
//            SizedBox(
//              width: 30,
//            ),
                              Container(
                                  height: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueGrey, width: .2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),

                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.add, size: 15),
                                        onPressed: () {
                                          Firestore.instance.collection('Cart')
                                              .document(document.documentID)
                                              .updateData({
                                            'quantity': document['quantity'] + 1,
                                            'total_price':document['total_price']+document['price']

                                          });
                                          setState(() {
                                            Cart.totalPrice+=document['price'];

                                          });


                                        },
                                        padding: EdgeInsets.all(0),),

                                      AutoText(text: "${document['quantity']}",
                                        size: 15,),

                                      IconButton(icon: Icon(
                                        Icons.arrow_downward, size: 15,)
                                        , padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          if (document['quantity'] > 1)
                                            Firestore.instance.collection(
                                                'Cart').document(
                                                document.documentID).updateData(
                                                {
                                                  'quantity': document['quantity'] -
                                                      1,
                                                  'total_price':document['total_price']-document['price']

                                                });
                                          setState(() {
                                            Cart.totalPrice-=document['price'];

                                          });




                                        },),
                                    ],
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () {
                                    Firestore.instance.collection('Cart')
                                        .document(document.documentID)
                                        .delete();
                                    Firestore.instance.collection('Product')
                                        .document(document.documentID)
                                        .updateData({'cart': false});
                                    if (document['favourite'])
                                      Firestore.instance.collection('Favourite')
                                          .document(document.documentID)
                                          .updateData({'cart': false});

                                  setState(() {
                                    Cart.totalPrice-=document['total_price'];
                                  });


                                  },
                                  child: Image(
                                    image: AssetImage("images/icon-trash.png"),
                                    width: 20,),
                                ),
                              )
                            ]
                        )));
              }).toList(),
            );
        }
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

        bottomNavigationBar:Container(
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor
          ),
          child: Padding(padding: const EdgeInsets.only(top:0,bottom:0,right: 30,left: 30),

            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("المجموع: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("${Cart.totalPrice} ر.س",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),

                InkWell(
                  child: Text("متابعة الشراء",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                  onTap: (){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Address()));
                  },
                )
              ],
            ),
          ),
        )

      ),
    );
  }
}

