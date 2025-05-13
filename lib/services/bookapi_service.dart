import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:bookbazaar/models/book_model.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.17.8:7000/api/book';

  static Future<List<Book>> seachBook(String Query) async 
  {
    final url = Uri.parse('$baseUrl/searchbook?nameofbook=$Query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books Response Body: ${response.body}');
      }
  }

  static Future<List<Book>> myUploadedBook(int UserID) async 
  {
    final url = Uri.parse('$baseUrl/uploadedbooks?userID=$UserID');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books Response Body: ${response.body}');
      }
  }

   static Future<void> uploadBookData({required String title,required String author,required String category,required String price,required String sellerId,required File imageFile}) async {
    try {
      
      // Prepare the multipart request
      var uri = Uri.parse('$baseUrl/upload');
      var request = http.MultipartRequest('POST', uri);

      // Add other data (book details)
      request.fields['title'] = title;
      request.fields['author'] = author;
      request.fields['category'] = category;
      request.fields['price'] = price;
      request.fields['sellerid'] = sellerId;

      // Add image to the request
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: imageFile.path.split('/').last,
          contentType: MediaType('image', 'jpeg')); // or image/png, based on the file type

      // Add file to request
      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Handle response
      if (response.statusCode == 200) {
        print("Upload successful");
      } else {
        print("Upload failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading book data: $e");
    }
    }
}
