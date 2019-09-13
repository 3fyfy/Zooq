import 'package:flutter/material.dart';

import 'component/BottomNavPay.dart';
import 'Pay.dart';
import 'Address.dart';

class CustAddress extends StatefulWidget {
  @override
  _CustAddressState createState() => _CustAddressState();
}

class _CustAddressState extends State<CustAddress> {
  bool check=true;


  @override
  Widget build(BuildContext context) {


    Widget _addressBuilder() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.check_circle,color:check?Colors.green:Colors.grey,),
                  onPressed: () {
                    setState(() {
                      check=!check;
                    });
                  }
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('محمد علي'),
                      Text(
                        ' الرياض،شارع الملك فهد محمد.بجوار نادي الحوار الثفاقي0500050و',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xffc01232),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      child: Image.asset('images/icon-edit.png',height: 30,width: 20),

                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      child: Image.asset('images/icon-trash.png',height: 30,width: 20),

                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildButton(){

      return Padding(
        padding: const EdgeInsets.only(top:30.0,bottom: 2),
        child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
            },
            child: Container(
                width: 130,
                height: 45,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    border: Border.all(color: Theme.of(context).accentColor,style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(30))

                ),
                child: Container(
                  width:  (MediaQuery.of(context).size.width/4)-10,

                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      border: Border.all(color: Colors.white,style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))


                  ),
                  child: Center(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('اضافة عنوان جديد',style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      )),
                ))),
      );
    }

    Widget _buildListview(){
      return Container(
        height: MediaQuery.of(context).size.height/2-30,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,index){
              return _addressBuilder();
            }),
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

                Padding(
                    padding: const EdgeInsets.only(top:30,bottom:20,right: 20,left: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Column(children: <Widget>[
                      _buildListview(),
                        _buildButton()
                      ],

                    )
                ),
                ),
              ]
          ),

        ],);}


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: AppBar(
          title: Text( 'عناوين الشراء',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,

            ),),
          centerTitle: true,
          leading:Image(image:AssetImage('images/icon-logo3.png')) ,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){}),
            IconButton(icon: Icon(Icons.arrow_back_ios,textDirection: TextDirection.ltr
              ,), onPressed: (){Navigator.of(context).pop();}),
          ],
        ),
        body: _buildBody(),

        bottomNavigationBar: BottomNav(Pay()),

      ),
    );
  }

}
