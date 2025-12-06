import 'package:flutter/material.dart';

import 'products_screen.dart';
import 'favorites_page.dart';
import 'profile_page.dart';

class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  int _bottomNavbar = 0;

  final List<Widget> _pages = const [
    PerfumesPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'عطورنا';
      case 1:
        return 'المفضلة';
      case 2:
        return 'حسابي';
      default:
        return 'متجر العطور';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle(_bottomNavbar)),
        backgroundColor: Colors.blueGrey,
      ),
      body: IndexedStack(
        index: _bottomNavbar,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavbar,
        onTap: (index) {
          setState(() {
            _bottomNavbar = index;
          });
        },
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.blue[800],
        items: const [
          BottomNavigationBarItem(
            label: 'العطور',
            icon: Icon(Icons.local_mall),
          ),
          BottomNavigationBarItem(
            label: 'المفضلة',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'الحساب',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
