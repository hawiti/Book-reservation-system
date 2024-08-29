import 'package:flutter/material.dart';
import 'nav.dart';
import 'footer.dart';
import 'home.dart';
import 'login.dart';
import 'manageProfile.dart';
import 'viewBooks.dart';

class FAQPage extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: "What is My Book app?",
      answer: "My Book app is a user-friendly platform that allows you to reserve books online. You can browse, reserve, and manage your book reservations easily.",
    ),
    FAQItem(
      question: "How do I reserve a book?",
      answer: "To reserve a book, simply browse through the available books, select the book you want, and click the 'Reserve' button. You will be prompted to confirm your reservation.",
    ),
    FAQItem(
      question: "How do I manage my profile?",
      answer: "You can manage your profile by going to the 'Profile' section of the app, where you can update your personal information, change your password, and view your reservation history.",
    ),
    FAQItem(
      question: "Is My Book app free to use?",
      answer: "Yes, My Book app is completely free to use. You can browse and reserve books without any charges.",
    ),
  ];

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
            child: ListView.builder(
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                    faqItems[index].question,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(faqItems[index].answer),
                    ),
                  ],
                );
              },
            ),
          ),
          Footer(), // Add the Footer at the bottom of the screen
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
