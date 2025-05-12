import 'package:bookbazaar/services/userapi_servcie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SingupScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SingupScreen(this.isloginfunction, {super.key});

  final void Function() isloginfunction;

  void _signin(BuildContext context) async {
    final userauthService = UserapiService();
    try {
      final res = await userauthService.signupUser(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (res["success"]) {
        Navigator.pop(context);
        showModalBottomSheet(
          backgroundColor: Colors.cyan,
          context: context,
          builder: (ctx) {
            return Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.circleCheck),
                  Text(
                    "Signed in Succesfull \nNow Login using your credentials",
                  ),
                ],
              ),
            );
          },
        );
      } else {
        final _error = res["error"];
        showModalBottomSheet(
          backgroundColor: const Color.fromARGB(255, 203, 0, 0),
          context: context,
          builder: (ctx) {
            return Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.circleXmark, size: 28),
                  Text(
                    "Couldn't signin :( \nPlease try again! \nReason: $_error",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  const Color.fromARGB(255, 185, 45, 209),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Center(
              child: Text(
                "Welcome to BookBazar, \nPlease Register!",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 26),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.5 - 150,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                    controller: _nameController,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name",
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      fixedSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 21),
                    ),

                    onPressed: () {
                      _signin(context);
                    },
                    child: Text("SignUp"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
