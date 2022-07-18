import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/category_screen.dart';
// import 'package:foodcourtapp/Maps/map_screen.dart';
import 'package:foodcourtapp/pages/home/HomePage.dart';
import 'package:foodcourtapp/pages/profile/profilepage.dart';
import 'package:foodcourtapp/pages/scan/scanpage.dart';
import 'package:iconly/iconly.dart';

// import 'models/ItemModel.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main-screen';
  // final ItemModel item;
  MainScreen({Key? key,}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  // ItemModel item;
  _MainScreenState();
  
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    // MapScreen(),
    CategoryScreen(),
    QRScanPage(),
    ProfilePage(),
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
          elevation: 4,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: 'Home',
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(Icons.shopping_cart_rounded),
            //   label: 'Cart',
            // ),

            // BottomNavigationBarItem(
            //   icon: Icon(_selectedIndex == 1 ? IconlyBold.location : IconlyBold.location),
            //   label: 'Location',
            // ),

            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ? IconlyBold.category : IconlyBold.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2 ? IconlyBold.camera : Icons.camera),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3 ? CupertinoIcons.person_solid : CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      );

  }
}
