import 'package:flutter/material.dart';
import '../services/view_api_service.dart';
import 'home.dart';
import 'login.dart';
import 'manageProfile.dart';

class ViewBooks extends StatefulWidget {
  @override
  _ViewBooksState createState() => _ViewBooksState();
}

class _ViewBooksState extends State<ViewBooks> {
  final ViewApiService apiService = ViewApiService();
  List<Map<String, dynamic>> books = [];

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  void _fetchBooks() async {
    List<Map<String, dynamic>> fetchedBooks = await apiService.fetchBooks();
    setState(() {
      books = fetchedBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Books'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Image.asset(
                    'assets/image2.png', 
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: books.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book['title'] ?? '',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Author: ${book['author'] ?? ''}'),
                          const SizedBox(height: 8),
                          Text('Published on: ${book['publication_date'] ?? ''}'),
                          const SizedBox(height: 8),
                          Text('Description: ${book['description'] ?? ''}'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _showReservationDialog(context, book['title'] ?? '');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1c484c),
                            ),
                            child: const Text('Reserve',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showReservationDialog(BuildContext context, String bookTitle) {
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reserve $bookTitle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: startDateController,
                decoration:
                    InputDecoration(labelText: 'Start Date (YYYY-MM-DD)'),
              ),
              TextField(
                controller: endDateController,
                decoration:
                    InputDecoration(labelText: 'End Date (YYYY-MM-DD)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final String startDate = startDateController.text;
                final String endDate = endDateController.text;

                // Implement the reservation submission here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Reserved $bookTitle from $startDate to $endDate')),
                );

                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1c484c),
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
