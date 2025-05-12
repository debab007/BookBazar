import 'package:bookbazaar/screens/singup_screen.dart';
import 'package:bookbazaar/services/userapi_servcie.dart';
import 'package:flutter/material.dart';
import 'package:bookbazaar/services/shared_pref_service.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen(this.isloginfunction, {super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function() isloginfunction;

  void _loggedin(BuildContext context) async {
    final userauthService = UserapiService();
    try {
      final res = await userauthService.loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (res["success"]) {
        PreferenceHelper.setuserID(res["data"]["user"]["id"]);
        print(res["data"]["user"]["id"]);
        PreferenceHelper.setLoggedIn(true);
        isloginfunction();
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("${res["error"]}")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  void _signupClicked(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => SingupScreen(isloginfunction)),
    );
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
                "Welcome Back, Please Login!",
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
                  TextButton(
                    onPressed: () {
                      _signupClicked(context);
                    },
                    child: Text("If you are a new user, Click Here!"),
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
                      _loggedin(context);
                    },
                    child: Text("Login"),
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
