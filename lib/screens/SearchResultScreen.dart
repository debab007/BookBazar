import 'package:bookbazaar/models/book_model.dart';
import 'package:bookbazaar/widgets/book_card.dart';
import 'package:bookbazaar/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Searchresultscreen extends StatefulWidget {
  const Searchresultscreen({required this.books, super.key});

  final List<Book> books;
  @override
  State<Searchresultscreen> createState() => _SearchresultscreenState();
}

class _SearchresultscreenState extends State<Searchresultscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Result"), titleSpacing: 0),
      body: Column(
        children: [
          SearchBarWidget(),
          widget.books.isEmpty
              ? Center(
                child: Text(
                  "Opps No Books Found :(",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
              : Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.75,
                  ),
                  children: [
                    for (final book in widget.books) BookCard(book: book),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
