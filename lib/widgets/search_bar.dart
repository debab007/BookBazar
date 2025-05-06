import 'package:bookbazaar/api_service.dart';
import 'package:bookbazaar/models/book_model.dart';
import 'package:bookbazaar/screens/SearchResultScreen.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  void _searchBook(BuildContext context, String Query) async {
    try {
      List<Book> books = await ApiService.seachBook(Query);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => Searchresultscreen(books: books)),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      margin: EdgeInsets.fromLTRB(6, 3, 6, 3),
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(80, 0, 187, 212),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: "Search Book/Author",
          suffixIcon: IconButton(
            onPressed: () {
              final query = _controller.text;
              if (query.isNotEmpty) {
                _searchBook(context, query);
              } else {
                print("Not WOrking");
              }
            },
            icon: Icon(Icons.search),
          ),
          hintStyle: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
