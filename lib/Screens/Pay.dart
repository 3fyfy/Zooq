import 'package:flutter/material.dart';
import 'component/rate.dart';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  int _radioValue1 = -1;


  void _showDialoge(){
    showDialog(context: context,

        builder: (context){
          return RateDialog();

        }
    );
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }


  Widget _buildItem(String txt1, String txt2, int val, String img) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              new Radio(
                activeColor: Colors.black,
                value: val,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    txt1,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    txt2,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              
              height: 40,
              width: 50,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.contain,image: AssetImage(img))),

            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:  AppBar(
          title: Text(
            'خيارات الدفع',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Image.asset('images/icon-logo2.png'),

          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_forward_ios),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
        backgroundColor:Color(0xffc01232),
        body: ListView(
          children: <Widget>[
            Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _buildItem('الدفع ببطاقة الائتمان', 'فيزا او ماستر كارد', 0,
                        'images/visa.png'),
                    _buildItem('باي بال(payPal)',
                        'التكلفة الاضافية لهذه الخدمة هي 20 ر س', 1, 'images/paypal-logo.png'),
                    _buildItem('الدفع نقدا عند الاستلام',
                        'التكلفة الاضافية لهذه الخدمة هي 20 ر س', 2, 'images/WithMoney.png')
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                height: 460,
                width: 400,
                margin:
                    EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 80),
              ),
            ),

          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
              child:
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('299.00 ر.س',style: TextStyle(color: Color(0xffc01232),fontWeight:FontWeight.bold),),
                    InkWell(child: Text('تاكيد الدفع',style: TextStyle(color: Color(0xffc01232),fontWeight: FontWeight.bold),),onTap: (){
                      _showDialoge();


                      },),
                  ],),
              )
          ),
          //540
        ),
      ),
    );
  }
}