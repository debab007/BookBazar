import 'package:bookbazaar/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:transparent_image/transparent_image.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: "http://192.168.17.8:7000/uploads/${book.image}",

                  placeholder:
                      (context, url) => Image.memory(kTransparentImage),
                  errorWidget: (context, url, error) {
                    //print("Failed to load image: $url");
                    return Image.asset(
                      'assets/images/book1.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Title and Author
            Text(
              book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'by ${book.author}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),

            // Price
            Text(
              '₹${book.price}',
              style: TextStyle(
                fontSize: 22,
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Book Condition
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: const Color.fromARGB(255, 231, 63, 25),
                ),
                SizedBox(width: 8),
                Text(
                  'Condition: ${book.condition}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Seller Info
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.white,
                  ), /////make it the seller
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.author,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(book.author),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Description
            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              book.description == null ? "Not Available" : book.description!,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),

      // Buy Now Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Hook this with your checkout or cart logic
            showModalBottomSheet(
              context: context,
              builder: (ctx) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RippleAnimation(
                        color: const Color.fromARGB(147, 76, 175, 79),
                        delay: const Duration(milliseconds: 300),
                        repeat: false,
                        minRadius: 75,
                        maxRadius: 140,
                        ripplesCount: 6,
                        duration: const Duration(milliseconds: 6 * 300),

                        child: Icon(
                          FontAwesomeIcons.circleCheck,
                          color: Colors.green,
                          size: 36,
                        ),
                      ),
                      Text(
                        "Order Confirmed",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "Buy Now",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
