import 'package:coffeeapp/Activities/Home_Screen.dart';
import 'package:coffeeapp/Activities/getStarted.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    GetStartedPage(),
    HomeScreen(),
   ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                 icon: Icon(Icons.home,),
                label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,
                  ),
                label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,
                ),
              label: 'person',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
              ),
              label: 'person',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          backgroundColor:Color(0xffffffff) ,
          unselectedItemColor: Color(0xff8f8787),
          // selectedItemColor: Color(0xff531607),
          fixedColor:Color(0xff531607) ,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5

      ),
    );


  }
}
