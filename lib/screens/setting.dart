import 'package:flutter/material.dart';
import 'nav.dart';
import 'footer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(10),
          child: navbar(),
        ),
        backgroundColor: Color(0xFF1c484c),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1c484c),
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          'Enable Notifications',
                          style: TextStyle(color: Color(0xFF1c484c)),
                        ),
                        trailing: Switch(
                          value: _notificationsEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              _notificationsEnabled = value;
                            });
                          },
                          activeColor: Color(0xFF1c484c),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          'Enable Dark Mode',
                          style: TextStyle(color: Color(0xFF1c484c)),
                        ),
                        trailing: Switch(
                          value: _darkModeEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              _darkModeEnabled = value;
                            });
                          },
                          activeColor: Color(0xFF1c484c),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          'Account Settings',
                          style: TextStyle(color: Color(0xFF1c484c)),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF1c484c),
                        ),
                        onTap: () {
                          // Navigate to account settings
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          'Privacy & Security',
                          style: TextStyle(color: Color(0xFF1c484c)),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF1c484c),
                        ),
                        onTap: () {
                          // Navigate to privacy & security settings
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Footer(), // Add Footer outside of the container
        ],
      ),
    );
  }
}
