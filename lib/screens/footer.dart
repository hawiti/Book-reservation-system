import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final double iconSize = 24.0;

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Color(0xFF1c484c),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navigation Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  onPressed: () {
                    _launchURL('https://facebook.com/yourpage');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.email, color: Colors.white),
                  onPressed: () {
                    _launchURL('mailto:hawitulu71@gmail.com');
                  },
                ),
                const Text(
                  '© 2024 My Book. All rights reserved.',
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,),
                  
                ),
              ],
            ),
            // Copyright Notice
          ],
        ),
      ),
    );
  }
}
