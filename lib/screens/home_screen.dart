import 'package:bookbazaar/widgets/carousel_widget.dart';
import 'package:bookbazaar/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BookBazar",
          style: TextStyle(
            color: Colors.purple[400],
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: ListView(
        children: [
          SearchBarWidget(), ImageCarousel(), //ShopbyCategory()
        ],
      ),
    );
  }
}
