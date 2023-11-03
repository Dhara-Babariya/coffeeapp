import 'package:coffeeapp/Activities/Home_Screen.dart';
import 'package:coffeeapp/Activities/cart_screen.dart';
import 'package:coffeeapp/Activities/getStarted.dart';
import 'package:coffeeapp/Model/item_model.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
     CartPage(cartitem: []),
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
          items: [
            const BottomNavigationBarItem(
                 icon: Icon(Icons.home,),
                label: 'home',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search,
                  ),
                label: 'search',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,
                ),
              label: 'person',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person,
              ),
              label: 'person',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          backgroundColor:const Color(0xffffffff) ,
          unselectedItemColor: const Color(0xff8f8787),
          // selectedItemColor: Color(0xff531607),
          fixedColor:const Color(0xff531607) ,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 0,


      ),
    );


  }
}
