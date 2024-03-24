import 'package:flutter/material.dart';
import 'package:jsap/HomePage.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _certificationController = TextEditingController();

  bool _isVerified = false;
  bool _isVerifying = false; // New variable to track the verification process

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, //AppBar(
      //   title: Text('Verify Identity'),
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/jsap1.jpeg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Please provide your information for verification as a lab technician.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.black54),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 40.0,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Technician ID',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                  prefixIcon: Icon(
                    Icons.badge,
                    size: 37,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _certificationController,
                decoration: InputDecoration(
                  labelText: 'Certification',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                  prefixIcon: Icon(
                    Icons.school,
                    size: 40,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                if (!_isVerifying) {
                  // Set isVerifying to true to prevent multiple verifications
                  setState(() {
                    _isVerifying = true;
                  });

                  // Validation logic
                  String name = _nameController.text.trim();
                  String id = _idController.text.trim();
                  String certification = _certificationController.text.trim();

                  // Check if the provided information meets validation criteria
                  if (name.isNotEmpty &&
                      id.isNotEmpty &&
                      certification.isNotEmpty) {
                    // Your additional validation logic here
                    setState(() {
                      _isVerified = true;
                    });

                    // Delay for 2 seconds
                    await Future.delayed(Duration(seconds: 1));

                    // Navigate to home screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );

                    // Show snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Verified'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    // Show error message if any field is empty
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please fill out all fields.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  // Reset isVerifying after verification process completes
                  setState(() {
                    _isVerifying = false;
                  });
                }
              },
              icon: Icon(Icons.verified_user),
              label: Text('Verify'),
              style: ElevatedButton.styleFrom(primary: Colors.indigoAccent),
            ),
            SizedBox(height: 20.0),
            // Conditionally display "Verification successful!" based on _isVerified
            if (_isVerified &&
                !_isVerifying) // Check _isVerifying to avoid overlapping messages
              Text(
                'VerificationSuccessful!',
                style: TextStyle(fontSize: 18.0, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
