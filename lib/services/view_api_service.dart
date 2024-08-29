import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewApiService {
  final String apiUrl = 'http://localhost:3000/api/books';

  Future<List<Map<String, dynamic>>> fetchBooks() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        // Convert dynamic list to List<Map<String, dynamic>>
        List<Map<String, dynamic>> books = List<Map<String, dynamic>>.from(data);

        return books;
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Error fetching books: $e');
      return [];
    }
  }
}
