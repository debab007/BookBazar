import 'package:bookbazaar/screens/addbook_screen.dart';
import 'package:bookbazaar/screens/home_screen.dart';
import 'package:bookbazaar/screens/userprofileScreen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentindex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    AddbookScreen(),
    Userprofilescreen(),
    Userprofilescreen(),
  ];

  void _selectab(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectab,
        currentIndex: _currentindex,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Sell Book",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
