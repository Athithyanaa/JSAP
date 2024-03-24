import 'package:flutter/material.dart';
import 'package:jsap_sample/PatientInfoPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Analysis Summary',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black87,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.medical_information,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Welcome to YourAI',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: [
                _infoCard(context, '7', 'Recent Reports', () {
                  print('Predictive Analysis Pressed');
                }),
                _infoCard(context, '16', 'Analysis Result', () {
                  print('Diagnostic Imaging Pressed');
                }),
                _infoCard(context, '3', 'Predictive insights', () {
                  print('Treatment Planning Pressed');
                }),
                _infoCard(context, '1', 'Guidelines Available', () {
                  print('Patient Monitoring Pressed');
                }),
              ],
            ),
            ListTile(
              title: Text(
                "Today's tasks",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            ListTile(
              leading: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('View'),
              ),
              title: Text(
                'SCAN 101',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '9.30 - 11.00',
                style: TextStyle(color: Colors.black87),
              ),
              trailing: Icon(Icons.report),
            ),
            ListTile(
              leading: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Analyze'),
              ),
              title: Text(
                'ANALYSIS DETAILS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '13.00 - 15.30',
                style: TextStyle(color: Colors.black87),
              ),
              trailing: Icon(Icons.scanner),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _boldIcon(IconButton(
              onPressed: () {},
              icon: Icon(Icons.auto_graph),
            )),
            _boldIcon(IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientInfoPage()),
                );
              },
              icon: Icon(Icons.groups),
            )),
            _boldIcon(IconButton(
              onPressed: () {},
              icon: Icon(Icons.manage_accounts),
            )),
          ],
        ),
      ],
    );
  }

  Widget _boldIcon(Widget iconButton) {
    return Container(
      child: iconButton,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), // Adjust this value as needed
        border: Border.all(
            color: Colors.black87), // Add a border for visual separation
      ),
    );
  }

  Card _infoCard(BuildContext context, String title, String subtitle,
      VoidCallback onPressed) {
    return Card(
      color: Colors.deepOrangeAccent
          .withOpacity(0.9), // Add a light transparent color to the card
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(subtitle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
