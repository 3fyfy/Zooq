import 'package:flutter/material.dart';
import '../../../productdetails.dart';
import '../../../component/AutoText.dart';

class Listprod extends StatefulWidget {
  @override
  _ListprodState createState() => _ListprodState();
}

class _ListprodState extends State<Listprod> {

  List<dynamic> items=[
    {
      'name':'عطر اجنر اكس',
      'price': '130',
      'image':'images/1.jpg',
      'favourite':true
    },
    {
      'name':'عطر اجنر اكس',
      'price': '130',
      'image':'images/2.jpg',
      'favourite':false

    },
    {
      'name':'عطر اجنر اكس',
      'price': '130',
      'image':'images/3.jpg',
      'favourite':false

    },
    {
      'name':'عطر اجنر اكس',
      'price': '130',
      'image':'images/5.png',
      'favourite':false

    },

  ];


  @override
  Widget build(BuildContext context) {
    double heightProd= MediaQuery.of(context).size.height/4;
    double widthProd= MediaQuery.of(context).size.width/3;
    return  Container(
        height:heightProd,
        child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: 7,

              itemBuilder: (context,index){
                return Container(
                  width: widthProd,
                  decoration: BoxDecoration(
                      border: Border(left:BorderSide( color: Colors.grey,width: .5))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Product(
                            name:items[index%items.length]['name'] ,
                            image: items[index%items.length]['image'],
                            price: items[index%items.length]['price'],
                            favourite:items[index%items.length]['favourite'] ,
                            index: index,
                          )));
                        },
                        child: Container(
                          height: heightProd*(2/3)-20,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(items[index%items.length]['image']),fit: BoxFit.contain,),
                          ),
                        ),
                      ),
                      Container(
                        height:heightProd*(1/3) ,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:3.0,left: 3),
                              child: Container(
                                  height: heightProd*(1/3)/2,
                                  child:  AutoText(text: items[index%items.length]['name'],size: 25,fontWeight: FontWeight.bold,)

                              ),
                            ),


                            Container(

                               height: heightProd*(1/3)/2,
                                child: AutoText(text: "${items[index%items.length]['price']} ريال",
                                color: Theme.of(context).accentColor,
                                  size: 15,

                                )

                            ),
                          ],
                        ),
                      ),

                                     ],
                  ),
                );

              }),
    );
    }

}
