enum BookCategory {
  Fiction,
  NonFiction,
  Fantasy,
  Mystery,
  Science,
  History,
  Biography,
  Poetry,
}

class Book {
  final int id;
  final String title;
  final String author;
  final BookCategory category;
  final String price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: BookCategory.values.firstWhere(
          (e) => e.toString() == 'BookCategory.${json['category']}'), 
      price: json['price'],
    );
  }
}
