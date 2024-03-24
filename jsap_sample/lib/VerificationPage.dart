import 'package:flutter/material.dart';
import 'package:jsap_sample/HomePage.dart';
import 'package:jsap_sample/PatientInfoPage.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _certificationController = TextEditingController();

  bool _isVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Identity'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/jsap_verify.jpeg'),
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
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Technician ID',
                  prefixIcon: Icon(Icons.badge),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _certificationController,
                decoration: InputDecoration(
                  labelText: 'Certification',
                  prefixIcon: Icon(Icons.school),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientInfoPage()),
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: Icon(Icons.verified_user),
              label: Text('Verify'),
              style: ElevatedButton.styleFrom(primary: Colors.brown),
            ),
            SizedBox(height: 20.0),
            if (_isVerified)
              Text(
                'Verification successful!',
                style: TextStyle(fontSize: 18.0, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
