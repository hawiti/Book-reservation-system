import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<http.Response> registerUser({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/register');
    
    final body = json.encode({
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    });

    print('Sending POST request to $url');
    print('Request Body: $body');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      
      return response;
    } catch (e) {
      print('Error occurred: $e');
      rethrow;
    }
  }
}
