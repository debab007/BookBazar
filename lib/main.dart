import 'package:bookbazaar/screens/login_screen.dart';
import 'package:bookbazaar/screens/tab_screen.dart';
import 'package:bookbazaar/services/shared_pref_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
 
  Widget _mainContent = TabScreen();

  @override
  void initState() {
    super.initState();
    isLoggedIn(); // Only called once here
  }

  void isLoggedIn() async {
    
    bool status = await PreferenceHelper.isLoggedIn();
    
    setState(() {
      if (status == true) {
        _mainContent = TabScreen();
      } else {
        _mainContent = LoginScreen(isLoggedIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: _mainContent);
  }
}
