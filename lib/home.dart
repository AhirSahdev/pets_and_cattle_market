// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/accountpage.dart';
import 'package:pets_and_cattle_market/homepage.dart';
import 'package:pets_and_cattle_market/notificationpage.dart';
import 'package:pets_and_cattle_market/responsepage.dart';
import 'package:pets_and_cattle_market/sellercategories.dart';

//import 'locationpage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    Container(key: const PageStorageKey('page1'), child: HomeScreenn()),
    Container(key: const PageStorageKey('page2'), child: Response()),
    Container(key: const PageStorageKey('page3'), child: Buyer_Categories()),
    Container(key: const PageStorageKey('page4'), child: NotificationPage()),
    Container(key: const PageStorageKey('page5'), child: Accountpage()),
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
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.reply_all),
            label: 'Response',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Sell',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
