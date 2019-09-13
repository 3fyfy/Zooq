import 'package:flutter/material.dart';

//component
import '../component/HeaderGridView.dart';
import '../component/AutoText.dart';


//screen
import '../productdetails.dart';


//data
import '../Data/DataProd.dart';


class GridViewProd extends StatefulWidget {
  @override
  _GridViewProdState createState() => _GridViewProdState();
}

class _GridViewProdState extends State<GridViewProd> {

  List<dynamic> items=DataProd().items;

  Widget _buildButton(){
    return Padding(
      padding: const EdgeInsets.only(top:0.0,bottom: 2),
      child: InkWell(
          onTap: (){},
          child: Container(

              width: MediaQuery.of(context).size.width/3,
              // height: 0,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  border: Border.all(color: Theme.of(context).accentColor,style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(20))

              ),
              child: Container(
                width:  (MediaQuery.of(context).size.width/3)-10,

                //height: 30,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    border: Border.all(color: Colors.white,style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage("images/logo-shopcar.png"),width: 20,),
                        SizedBox(width: 10,),
                        AutoText(text:"اضف للسلة" ,size: 10,color:Colors.white,fontWeight: FontWeight.bold ,),
                      ],
                    )),
              ))),
    );
  }

  Widget  _buildItem(int index,double heightItem){

    return Column(
      children: <Widget>[
        Container(
          height: heightItem/3,
          child: Stack(

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:7.0),
                child: InkWell(

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

                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(items[index%items.length]['image'],),fit: BoxFit.contain,)),
                  ),
                ),
              ),
              Positioned(
                  left: 2,
                  top: 2,
                  child: IconButton(icon: Icon((items[index%items.length]['favourite'])?Icons.favorite:Icons.favorite_border),color:(items[index%items.length]['favourite'])?Theme.of(context).accentColor:Colors.grey ,iconSize: 15, onPressed: (){

                    setState(() {
                      items[index%items.length]['favourite']=!items[index%items.length]['favourite'];
                    });
                  }))
            ],
          ),
        ),


        Container(
          width: (MediaQuery.of(context).size.width/2),
          child: Center(
            child: Column(
              children: <Widget>[

                AutoText(text:items[index%items.length]['name'] ,size: 20,),

                AutoText(text:"${items[index%items.length]['price']} ريال",size: 15,color:Theme.of(context).accentColor,fontWeight: FontWeight.bold ,)
                //  )

              ],
            ),
          ),
        ),

        _buildButton()

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    double heightItem=height/3;

    return  ListView(
      children: <Widget>[
        Header(),
        Container(
          width: width,
          height: height-120,
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1) ,
            itemBuilder: (BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                    height: heightItem,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),

                    child:  _buildItem(index,heightItem)),
              );
            },


          ),
        ),

      ],
    );
  }
}





