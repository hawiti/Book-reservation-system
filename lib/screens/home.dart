import 'package:flutter/material.dart';
import 'login.dart';
import 'footer.dart' ; 
import 'nav.dart';
import 'manageProfile.dart';
import 'viewBooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Book',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1c484c)),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(padding: EdgeInsets.all(10),
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
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255), // Set container background color to white
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.2),
                  //     blurRadius: 10,
                  //     offset: const Offset(0, 5),
                  //   ),
                  // ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/image2.png', 
                          height: 250, 
                          width: 250, 
                        ),
                        const SizedBox(width: 10), // Add spacing between image and text
                        const Text(
                          'Welcome!!',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFF1c484c), // Set text color
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Spacing between rows
                    const Text(
                      'Discover, Reserve, and Enjoy your favorite books!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF1c484c), // Set text color
                        // shadows: [
                        //   Shadow(
                        //     blurRadius: 5.0,
                        //     color: Colors.black87,
                        //     offset: Offset(2.0, 2.0),
                        //   ),
                        // ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20), // Spacing between text and button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        backgroundColor: const Color(0xFF1c484c), // Set button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Reserve Interesting Books Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Footer(), // Move Footer out of the centered container
        ],
      ),
    );
  }
}
