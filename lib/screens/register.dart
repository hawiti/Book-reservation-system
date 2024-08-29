import 'package:flutter/material.dart';
import 'package:my_book/screens/home.dart';
import 'package:my_book/screens/viewBooks.dart';
import '../services/api_service.dart';
import 'nav.dart';
import 'footer.dart';
import 'manageProfile.dart';
import 'login.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  //baseUrl: 'http://localhost:3000'

  final ApiService _apiService = ApiService(baseUrl: 'http://192.168.137.199:8800');

  void _register() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registering...')),
      );

      final response = await _apiService.registerUser(
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );
      print('$response');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful!')),
        );
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      } 
      else if(response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${response.body}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
          padding: EdgeInsets.all(10),
          child: navbar(),
        ),
        backgroundColor: const Color(0xFF1c484c),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Image.asset(
                    'assets/image2.png', // Replace with your logo asset path
                    height: 100, // Increase the height for a bigger logo
                    width: 200, // Increase the width for a bigger logo
                  ),
                ],
              ),
            ),
            ListTile(
            leading: const Icon(Icons.home, color: Color(0xFF1c484c)), 
            title: const Text("Home", style: TextStyle(color: Color(0xFF1c484c))), 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.login, color: Color(0xFF1c484c)), 
            title: const Text("Login", style: TextStyle(color: Color(0xFF1c484c))), 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box, color: Color(0xFF1c484c)), 
            title: const Text("Profile", style: TextStyle(color: Color(0xFF1c484c))), 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    initialName: "John Doe",  
                    initialPhone: "1234567890",  
                    initialEmail: "johndoe@example.com",  
                    initialPassword: "password123",  
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books, color: Color(0xFF1c484c)), 
            title: const Text("View Books", style: TextStyle(color: Color(0xFF1c484c))), 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewBooks()),
              );
              },
            ),
          ],
        ),
    ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: ' Name',
                          ),
                          onChanged: (value) => name = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your  name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone number',
                          ),
                          onChanged: (value) => phoneNumber = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          onChanged: (value) => email = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          onChanged: (value) => password = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            if (!RegExp(r'[a-z]').hasMatch(value)) {
                              return 'Password must contain at least one lowercase letter';
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Password must contain at least one digit';
                            }
                            if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                              return 'Password must contain at least one special character';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                          obscureText: true,
                          onChanged: (value) => confirmPassword = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != password) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                          backgroundColor: const Color(0xFF1c484c), // Set button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Footer(), // Add the Footer widget here
        ],
      ),
    );
  }
}
