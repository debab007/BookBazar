import 'package:bookbazaar/services/shared_pref_service.dart';
import 'package:flutter/material.dart';

class Userprofilescreen extends StatelessWidget {
  Userprofilescreen({super.key});

  void _clicked() async {
    PreferenceHelper.setLoggedIn(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: _clicked, child: Text("Log Out")),
      ),
    );
  }
}
