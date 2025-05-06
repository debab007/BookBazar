import 'package:bookbazaar/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Bookdetailsscreen extends StatelessWidget {
  const Bookdetailsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          SearchBarWidget(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  color: Colors.grey,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/book1.jpg",
                      width: 50,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
