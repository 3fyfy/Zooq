import 'package:flutter/material.dart';


//Screen navbar

//import 'navpages/Profile.dart';
import 'Login.dart';
import 'List.dart';
import 'Search.dart';
import 'Favourites.dart';
import 'Home/Home.dart';




class Mainnavbar extends StatefulWidget {
  @override
  _MainnavbarState createState() => _MainnavbarState();
}

class _MainnavbarState extends State<Mainnavbar> {


  final scaffoldKey=GlobalKey<ScaffoldState>();

  int _selectedIndex=3;
  Widget body= Home();
  List <Widget> pages=[
    ListDrawer(),
    Search(),
    Favourite(),
    Login()
 ];


  void _onItemTapped(int index) {
    setState(() {
      if(index == 0) {
        scaffoldKey.currentState.openDrawer();

      }
      else {
        _selectedIndex = index;
        body= pages[_selectedIndex];
      }

    });
  }

  Widget build(BuildContext context) {

    return Directionality(

      textDirection: TextDirection.rtl,
      child: Scaffold(

key: scaffoldKey,

        drawer:Drawer(child:  ListDrawer(),),

       body:body,
        bottomNavigationBar: BottomNavigationBar(
showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.black54),


          items: [
            BottomNavigationBarItem(

              icon: Icon(Icons.format_list_bulleted),
                title: Padding(padding: EdgeInsets.only(bottom: 10))

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
                title: Padding(padding: EdgeInsets.only(bottom: 10))
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
                title: Padding(padding: EdgeInsets.only(bottom: 10))
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.person),
                title: Padding(padding: EdgeInsets.only(bottom: 10))
            ),
          ],
          backgroundColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,

          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        )
      ),
    );
  }
}
