import 'package:flutter/material.dart';
import 'package:jsap/EditProfilePage.dart';
import 'package:jsap/PatientInfoPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.account_circle,
                                  size: 50.0,
                                  color:
                                      Colors.indigo), // Customized profile icon
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfilePage()),
                                );
                              },
                            ),
                            /*Text(
                              'Profile',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),*/
                          ],
                        ),
                      ),
                    ],
                  ),
                  WelcomeSection(),
                  PatientDetailsSection(),
                  Container(
                    margin: EdgeInsets.only(left: 8.0), // Left margin
                    child: Text(
                      'Scan Categories :', // Added text
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ScanCategoriesSection(),
                ],
              ),
            ),
          ),
          FooterSection(), // Place the footer at the bottom
        ],
      ),
    );
  }
}

class WelcomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Welcome to YourHealthAI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/jsap1.jpeg'),
          ),
        ],
      ),
    );
  }
}

class PatientDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8.0), // Left margin
              child: Text(
                'Patient Details :', // Added text
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            // Added space between text and progress indicator
            LinearProgressIndicator(
              value: 0.7, // Progress value
            ),
            ListTile(
              title: Text('Athi AA'),
              subtitle: Text('Patient ID: 1517'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanCategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: [
        CardOne(),
        CardTwo(),
        CardThree(),
        CardFour(),
      ],
    );
  }
}

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Custom action for card one
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.menu_book,
                  size: 40,
                  color: Colors.indigoAccent,
                ),
                SizedBox(
                    height: 10), // Add some space between the icon and text
                Text(
                  'Tumor Types',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '5 New Scans',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                    height:
                        10), // Add spacing between texts and progress indicator
                LinearProgressIndicator(
                  value: 0.9, // Example value, adjust as needed
                ),
              ],
            ),
          ),
        ));
  }
}

class CardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Custom action for card two
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.save_as_outlined,
                  size: 40,
                  color: Colors.indigoAccent,
                ),
                SizedBox(
                    height: 10), // Add some space between the icon and text
                Text(
                  'Automated Analysis',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '2 New Scans',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                    height:
                        10), // Add spacing between texts and progress indicator
                LinearProgressIndicator(
                  value: 0.3, // Example value, adjust as needed
                ),
              ],
            ),
          ),
        ));
  }
}

class CardThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Custom action for card three
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                  size: 40,
                  color: Colors.indigoAccent,
                ),
                SizedBox(
                    height: 10), // Add some space between the icon and text
                Text(
                  'Detailed Report',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '9 New Scans',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                    height:
                        10), // Add spacing between texts and progress indicator
                LinearProgressIndicator(
                  value: 0.1, // Example value, adjust as needed
                ),
              ],
            ),
          ),
        ));
  }
}

class CardFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Custom action for card four
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.doorbell_outlined,
                  size: 40,
                  color: Colors.indigoAccent,
                ),
                SizedBox(
                    height: 10), // Add some space between the icon and text
                Text(
                  'Characteristics',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '5 New Scans',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                    height:
                        10), // Add spacing between texts and progress indicator
                LinearProgressIndicator(
                  value: 0.5, // Example value, adjust as needed
                ),
              ],
            ),
          ),
        ));
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.save_alt, size: 36.0, color: Colors.indigo),
                onPressed: () {
                  // Save report action
                },
              ),
              Text(
                'Report',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon:
                    Icon(Icons.cloud_upload, size: 36.0, color: Colors.indigo),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LabTestsPage()),
                  );
                },
              ),
              Text(
                'Upload',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.visibility, size: 36.0, color: Colors.indigo),
                onPressed: () {
                  // View action
                },
              ),
              Text(
                'View',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//----------------

class LabTestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Lab Tests'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TestCard(
              icon: Icons.healing,
              testName: 'Blood Test',
              onPressed: () => _navigateToUploadPage(context, 'Blood Test'),
            ),
            TestCard(
              icon: Icons.science,
              testName: 'CT Scan',
              onPressed: () => _navigateToUploadPage(context, 'CT Scan'),
            ),
            TestCard(
              icon: Icons.settings_cell,
              testName: 'MRI',
              onPressed: () => _navigateToUploadPage(context, 'MRI'),
            ),
            TestCard(
              icon: Icons.radio_button_checked,
              testName: 'X-ray',
              onPressed: () => _navigateToUploadPage(context, 'X-ray'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToUploadPage(BuildContext context, String testType) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadPage(testType)),
    );
  }
}

class TestCard extends StatelessWidget {
  final IconData icon;
  final String testName;
  final VoidCallback onPressed;

  const TestCard({
    required this.icon,
    required this.testName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.deepPurple,
          size: 40,
        ),
        title: Text(testName),
        onTap: onPressed,
      ),
    );
  }
}

//----------------

class UploadPage extends StatelessWidget {
  final String testType;

  UploadPage(this.testType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Upload $testType Report'),
      ),
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: () {
            // Navigate to upload success page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientInfoPage()),
            );
          },
          label: Text(
            'Upload $testType Report',
          ),
          icon: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 2, 233, 233),
        ),
      ),
    );
  }
}
