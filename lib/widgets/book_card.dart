import 'package:bookbazaar/models/book_model.dart';
import 'package:bookbazaar/screens/BookDetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void pushDeatilsScreen(BuildContext context, Book book) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (ctx) => BookDetailsScreen(book: book)),
  );
}

class BookCard extends StatelessWidget {
  const BookCard({required this.book, super.key});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushDeatilsScreen(context, book);
      },
      splashColor: const Color.fromARGB(66, 0, 0, 0),
      child: Card(
        elevation: 2,

        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(12, 0, 0, 0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  //Image.asset("./assets/images/book1.jpg"),
                  CachedNetworkImage(
                    imageUrl: "http://192.168.17.8:7000/uploads/${book.image}",

                    placeholder:
                        (context, url) => Image.memory(kTransparentImage),
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        'assets/images/book1.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                    fit: BoxFit.cover,
                    height: 123,
                    width: double.infinity,
                  ),
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
