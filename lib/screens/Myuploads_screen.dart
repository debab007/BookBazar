import 'package:bookbazaar/models/book_model.dart';
import 'package:bookbazaar/services/bookapi_service.dart';
import 'package:bookbazaar/services/shared_pref_service.dart';
import 'package:bookbazaar/widgets/book_card.dart';
import 'package:flutter/material.dart';

class MyuploadsScreen extends StatefulWidget {
  MyuploadsScreen({super.key});
  List<Book> books = [];

  void _searchBookbyUserID(BuildContext context) async {
    try {
      int userID;
      userID = await PreferenceHelper.getuserID();
      books = await ApiService.myUploadedBook(userID);
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error :$e")));
    }
  }

  @override
  State<MyuploadsScreen> createState() => _MyuploadsScreenState();
}

class _MyuploadsScreenState extends State<MyuploadsScreen> {
  @override
  void initState() {
    super.initState();
    widget._searchBookbyUserID(context); // Called when screen is first created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Uploaded Books")),
      body:
          widget.books.isEmpty
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Opps..... You have not uploaded any books :(",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
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
    );
  }
}
