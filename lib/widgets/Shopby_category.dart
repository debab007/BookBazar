import 'package:flutter/material.dart';

class ShopbyCategory extends StatelessWidget {
  const ShopbyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.fromLTRB(0, 2, 0, 8),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(47, 0, 187, 212),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Shop by Categories",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.purple[400],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.book, size: 50),
              Icon(Icons.book, size: 50),
              Icon(Icons.book, size: 50),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.book, size: 50),
              Icon(Icons.book, size: 50),
              Icon(Icons.book, size: 50),
            ],
          ),
        ],
      ),
    );
  }
}
