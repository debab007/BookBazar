import 'dart:convert';
import 'package:http/http.dart' as http;

class UserapiService {
  final String baseUrl = "http://192.168.17.8:7000";

  Future<Map<String, dynamic>> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/signup');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/login');
    

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final body = jsonDecode(response.body);
    if (response.statusCode == 201) {
      print("${response.body}100");
      return {"success": true, "data": body};
    } 
    if (response.statusCode == 200) {
      print("${response.body}100");
      return {"success": true, "data": body};
    } 
    else {
      //printToConsole(response.body);
      print("${response.statusCode}");

      
      return {"success": false, "error": body['message'] ?? 'Unknown error'};
    }
  }
}
