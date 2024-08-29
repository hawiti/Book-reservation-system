import 'package:flutter/material.dart';
class BookReservationPage extends StatefulWidget {
  @override
  _BookReservationPageState createState() => _BookReservationPageState();
}

class _BookReservationPageState extends State<BookReservationPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedBook;
  DateTime? _startDate;
  DateTime? _endDate;

  final List<String> _availableBooks = [
    'Book 1: Flutter Development',
    'Book 2: Learning Dart',
    'Book 3: Advanced Node.js',
    'Book 4: Mastering Laravel',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reservation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Select a Book:', style: TextStyle(fontSize: 16)),
              DropdownButtonFormField<String>(
                value: _selectedBook,
                hint: Text('Choose a book'),
                onChanged: (newValue) {
                  setState(() {
                    _selectedBook = newValue;
                  });
                },
                items: _availableBooks.map((book) {
                  return DropdownMenuItem(
                    value: book,
                    child: Text(book),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a book';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Reservation Start Date:', style: TextStyle(fontSize: 16)),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: _startDate == null
                      ? 'Select start date'
                      : _startDate!.toLocal().toString().split(' ')[0],
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _startDate = pickedDate;
                    });
                  }
                },
                validator: (value) {
                  if (_startDate == null) {
                    return 'Please select a start date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Reservation End Date:', style: TextStyle(fontSize: 16)),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: _endDate == null
                      ? 'Select end date'
                      : _endDate!.toLocal().toString().split(' ')[0],
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _startDate ?? DateTime.now(),
                    firstDate: _startDate ?? DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _endDate = pickedDate;
                    });
                  }
                },
                validator: (value) {
                  if (_endDate == null) {
                    return 'Please select an end date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle the reservation request submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Reservation request submitted')),
                      );
                    }
                  },
                  child: Text('Submit Reservation'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
