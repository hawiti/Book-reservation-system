import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart'; // Assuming this is the page the user is redirected to after logout

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  Future<void> _signOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Clear all stored data (including authentication tokens, user info, etc.)
    await prefs.clear();

    // Navigate to the login page after sign-out
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()), 
      (Route<dynamic> route) => false, // Removes all routes from the stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signOut(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1c484c),
          ),
          child: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
