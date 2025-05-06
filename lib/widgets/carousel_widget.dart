import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      "assets/images/book1.jpg",
      "assets/images/book2.jpeg",
    ];
    return CarouselSlider(
      items:
          imgList
              .map(
                (item) => Container(
                  margin: EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
      options: CarouselOptions(
        height: 220,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }
}
