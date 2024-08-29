import 'package:flutter/material.dart';
import '../services/login_api_service.dart'; // Import the ApiService
import 'register.dart';
import 'footer.dart';
import 'nav.dart';
import 'viewBooks.dart';
import 'home.dart';
import 'manageProfile.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(padding: EdgeInsets.all(10),
        child:  navbar(),
        ),
        backgroundColor: Color(0xFF1c484c),
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
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C484C),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Set container background color to white
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Email",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Password",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 16.0),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  bool success = await LoginApiService.login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  if (success) {
                                    // Navigate to the home page on successful login
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => MainPage()),
                                    );
                                  } else {
                                    // Show error message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Login failed: Invalid credentials')),
                                    );
                                  }
                                } catch (e) {
                                  // Show error message for other exceptions
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Login failed: $e')),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Please fill out all fields')),
                                );
                              }
                            },

                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                                    backgroundColor: const Color(0xFF1C484C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text('Login',
                                  style: TextStyle(color: Colors.white),
                                  
                                  ),
                                  
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => RegistrationPage()),
                                    );
                                  },
                                  child: const Text(" Don't you have an account? Create new account",
                                  style: TextStyle(
                                    color: const Color(0xFF1C484C),
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Footer(), // Add the Footer here
        ],
      ),
    );
  }
}
