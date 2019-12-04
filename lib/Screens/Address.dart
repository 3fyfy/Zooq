import 'package:flutter/material.dart';
import 'MoreAdress.dart';

import 'component/map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Address extends StatefulWidget {
 final String _adressId;
 Address(this._adressId);

  @override
  _AddressState createState() => _AddressState(this._adressId);
}

class _AddressState extends State<Address> {

  final String _adressId;
  _AddressState(this._adressId);

  final TextEditingController _description = TextEditingController();
  final  TextEditingController _phone = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  final TextEditingController _street = TextEditingController();
  String _city;
  bool check=true;
 @override
  void initState() {
  if(_adressId!='') {
      Firestore.instance.collection('Address').document(_adressId).get().then((DocumentSnapshot snapshot) {
       this._description.text=snapshot['description'];
       this._street.text=snapshot['street'];
       this._phone.text=snapshot['phone'];
       this._notes.text=snapshot['notes'];
       this._city=snapshot['city'];
       this.check=snapshot['check'];
      });
    }
    // TODO: implement initState
    super.initState();
  }


   final _formKey = GlobalKey<FormState>();




  @override

  Widget build(BuildContext context) {


    Widget dropDown(){
      String hint;
     if(_city==null) hint="المدينة";
     else hint=_city;

      return  DropdownButtonFormField(
        decoration: InputDecoration(
          hintText:hint,
              contentPadding: EdgeInsets.all(5)
        ),

        onChanged: (Object value){
          setState(() {
            _city = value;
          });
        },
        value:_city ,
          items:<String> ['القاهرة', 'الاسكندرية', 'المنصورة', 'اسوان'].map((String value){

        return DropdownMenuItem<String>(
            value: value,
            child: Text(value));

      }).toList() ,

      );
    }



    Widget  _buildTextField(String val,TextEditingController cont)
    {

      return Padding(
        padding: const EdgeInsets.only(top: 0,right: 0,left: 0),
        child: TextFormField(
          controller: cont,
          validator: (value) => value.isEmpty ? "$val لا يجب ان يكون فارغا " : null,
          decoration: InputDecoration(
            hintText: val,

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
            onTap: ()async{

              print('clxllkvlxkvlcvxv${_street.text}');
              if (_formKey.currentState.validate()&&_city!=null) {

                if(_adressId=='')
                await Firestore.instance.collection('Address')
                    .document()
                    .setData({
                  'city': _city,
                  'street': _street.text,
                  'phone': _phone.text,
                  'description': _description.text,
                  'notes': _notes.text,
                  'check':true
                });
                else
                  await Firestore.instance.collection('Address')
                      .document(_adressId)
                      .updateData({
                    'city': _city,
                    'street': _street.text,
                    'phone': _phone.text,
                    'description': _description.text,
                    'notes': _notes.text,
                    'check':check
                  });


                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustAddress()));
              }
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
          child: Form(
            key: _formKey,
            child:
            Column(children: <Widget>[


              dropDown(),

              _buildTextField("الشارع",_street),
              _buildTextField("معلم قريب منه",_description),
              _buildTextField("رقم الهاتف",_phone),
              _buildTextField("ملاحظات الشحن",_notes),


              _buildButton()

            ],
          ),


        ),
      ));
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
