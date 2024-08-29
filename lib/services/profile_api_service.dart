import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileApiService {
  static Future<bool> updateProfile({
    required Map<String, String> profileData,
    required String token,
  }) async {
    final url = Uri.parse('https://yourapi.com/update-profile'); // Replace with your API endpoint

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Include the authorization token
    };

    final response = await http.put(
      url,
      headers: headers,
      body: json.encode(profileData),
    );

    if (response.statusCode == 200) {
      // Profile updated successfully
      return true;
    } else {
      // Handle errors or unsuccessful update
      return false;
    }
  }
}
