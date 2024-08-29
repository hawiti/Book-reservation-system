import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApiService {
  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.137.199:8800/api/auth/login'), // Use the correct API endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Handle the response as needed, e.g., save token or user data
      return true;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}
