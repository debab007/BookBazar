import 'package:bookbazaar/screens/home_screen.dart';
import 'package:bookbazaar/screens/tab_screen.dart';
import 'package:flutter/material.dart';


void main() {
  
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TabScreen());
  }
}
