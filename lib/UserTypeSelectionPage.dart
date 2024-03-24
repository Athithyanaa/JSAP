import 'package:flutter/material.dart';
import 'package:jsap/UserPage.dart';
import 'package:jsap/VerificationPage.dart';

class UserTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/jsap1.jpeg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VerificationPage()), // Navigate to page 1 for lab technician
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button color
                onPrimary: Colors.blue, // Text color
              ),
              child: Text(
                'Lab Technician',
                style: TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ), // Button text
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserPage()), // Navigate to page 2 for user
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button color
                onPrimary: Colors.blue, // Text color
              ),
              child: Text(
                'User',
                style: TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ), // Button text
            ),
          ],
        ),
      ),
    );
  }
}
