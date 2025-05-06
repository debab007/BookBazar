import 'package:bookbazaar/models/book_model.dart';
import 'package:bookbazaar/screens/BookDetailsScreen.dart';
import 'package:flutter/material.dart';

void pushDeatilsScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (ctx) => Bookdetailsscreen()),
  );
}

class BookCard extends StatelessWidget {
  const BookCard({required this.book, super.key});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushDeatilsScreen(context);
      },
      splashColor: const Color.fromARGB(66, 0, 0, 0),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(33, 0, 0, 0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("./assets/images/book1.jpg"),
                  Icon(
                    Icons.telegram,
                  ), //edit this later to change accroding to the condition of the book
                ],
              ),

              SizedBox(
                height: 55,
                child: Text(
                  book.title,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                child: Text(
                  'By: ${book.author}',
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              Text(
                'Rs:${book.price}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
