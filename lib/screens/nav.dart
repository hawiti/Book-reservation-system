import "package:flutter/material.dart";
import 'manageProfile.dart';
import 'FAQ.dart';
import 'home.dart';
import 'setting.dart';
import 'logout.dart';  // Assuming this is your logout page

class navbar extends StatelessWidget {
  const navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Enables horizontal scrolling if needed
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Logo at the start of the navbar
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: Image.asset(
          //     'assets/logo.png',
          //     height: 40,
          //   )
          // ),
          IconButton(
            icon: const Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            onPressed: () {
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
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.help),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQPage()),
              );
            },
          ),
          const SizedBox(width: 8),
          // Logout button at the end of the navbar
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              // Perform the logout operation here
            },
          ),
        ],
      ),
    );
  }
}
