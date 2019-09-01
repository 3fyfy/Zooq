import 'package:flutter/material.dart';
import 'MoreAdress.dart';

import 'component/map.dart';



class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final TextEditingController _city = TextEditingController();
  String dropdownValue;

  @override

  Widget build(BuildContext context) {


    Widget dropDown(){

      return  DropdownButtonFormField(

        decoration: InputDecoration(
          hintText:"المدينة"
        ),

        onChanged: (Object value){
          setState(() {
            dropdownValue = value;
            print(dropdownValue);
          });
        },
        value:dropdownValue ,
          items:<String> ['A', 'B', 'C', 'D'].map((String value){

        return DropdownMenuItem<String>(
            value: value,
            child: Text(value));

      }).toList() ,

      );
    }



    Widget _buildTextField(String hintText)
    {
      return Padding(
        padding: const EdgeInsets.only(top: 0,right: 0,left: 0),
        child: TextFormField(

          decoration: InputDecoration(
            hintText: hintText,

            border:UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,width:1 )),

            hintStyle: TextStyle(fontSize: 10,color: Colors.black87),
          ),

          cursorColor: Theme.of(context).accentColor,

        ),
      );
    }

    Widget _buildButton(){

      return Padding(
        padding: const EdgeInsets.only(top:30.0,bottom: 2),
        child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CustAddress()));
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
                      borderRadius: BorderRadius.all(Radius.circular(30))


                  ),
                  child: Center(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("متابعة",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      )),
                ))),
      );
    }

    Widget _buildBottomCarousel(){
      return Padding(
        padding: const EdgeInsets.only(top:0,bottom:0,right: 40,left: 40),
        child: Container(
          width:MediaQuery.of(context).size.width-80 ,
          child: Column(

            children: <Widget>[

              dropDown(),

              _buildTextField("الشارع"),
              _buildTextField("معلم قريب منه"),
              _buildTextField("رقم الهاتف"),
              _buildTextField("ملاحظات الشحن"),


              _buildButton()

            ],
          ),


        ),
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
    padding: const EdgeInsets.only(top:30,bottom:0,right: 20,left: 20),
    child: Container(
    height: MediaQuery.of(context).size.height-(AppBar().preferredSize.height+30),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(6))
    ),
    )
    ),
                 MapView(),


                Padding(padding:const EdgeInsets.only(top:200.0),


    child:_buildBottomCarousel(),

                )


              ]
          ),



        ],
      );

    }


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: AppBar(
          title: Text("العنوان",
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
              ,), onPressed: (){Navigator.of(context).pop();}),
          ],
        ),
        body: _buildBody(),

      ),
    );
  }
}
