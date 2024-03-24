import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 149, 156, 241),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle),
            SizedBox(width: 20),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.purple),
              onPressed: () {
                // Navigate to home page
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue.shade400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome to YourHealth AI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 100,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelfDiagnosticsPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.healing, color: Colors.purple),
                  label: Text(
                    'Self Diagnostics',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MediclopediaPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.book, color: Colors.purple),
                  label: Text(
                    'Mediclopedia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 80,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BloodBankPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.local_hospital, color: Colors.purple),
                  label: Text(
                    'Blood Bank',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.description, color: Colors.purple),
                  label: Text(
                    'My Reports',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat, color: Colors.purple),
                      SizedBox(width: 10),
                      Text(
                        'YHAI Bot - Start Chat',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 149, 156, 241),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Colors.purple),
            Icon(Icons.chat, color: Colors.purple),
            Icon(Icons.notifications, color: Colors.purple),
            Icon(Icons.local_hospital, color: Colors.purple),
            Icon(Icons.account_circle, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}

class SelfDiagnosticsPage extends StatefulWidget {
  @override
  _SelfDiagnosticsPageState createState() => _SelfDiagnosticsPageState();
}

class _SelfDiagnosticsPageState extends State<SelfDiagnosticsPage> {
  bool coughChecked = false;
  bool headacheChecked = false;
  bool stomachIssuesChecked = false;
  bool hypertensionChecked = false;
  bool nauseaChecked = false;
  bool diarrheaChecked = false;
  bool throatPainChecked = false;
  bool feverChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self Diagnostics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Symptoms'),
                  ),
                  CheckboxListTile(
                    title: Text('Cough'),
                    value: coughChecked,
                    onChanged: (value) {
                      setState(() {
                        coughChecked = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Headache'),
                    value: headacheChecked,
                    onChanged: (value) {
                      setState(() {
                        headacheChecked = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Stomach Issues'),
                    value: stomachIssuesChecked,
                    onChanged: (value) {
                      setState(() {
                        stomachIssuesChecked = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Hypertension'),
                    value: hypertensionChecked,
                    onChanged: (value) {
                      setState(() {
                        hypertensionChecked = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Nausea'),
                    value: nauseaChecked,
                    onChanged: (value) {
                      setState(() {
                        nauseaChecked = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Diarrhea'),
                    value: diarrheaChecked,
                    onChanged: (value) {
                      setState(() {
                        diarrheaChecked = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Throat Pain'),
                    value: throatPainChecked,
                    onChanged: (value) {
                      setState(() {
                        throatPainChecked = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Fever'),
                    value: feverChecked,
                    onChanged: (value) {
                      setState(() {
                        feverChecked = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Check for symptoms and display disease info if necessary
                if (coughChecked &&
                    headacheChecked &&
                    stomachIssuesChecked &&
                    hypertensionChecked &&
                    nauseaChecked &&
                    diarrheaChecked &&
                    throatPainChecked &&
                    feverChecked) {
                  // Display disease info card
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Disease Info'),
                      content: Text('Disease Name: Meningococcal Disease'),
                    ),
                  );
                }
              },
              child: Text('Check Symptoms'),
            ),
          ],
        ),
      ),
    );
  }
}

class MediclopediaPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mediclopedia'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for a tablet or medical question...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform search
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Solution:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'The solution will be displayed here.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//import 'package:select_form_field/select_form_field.dart';

/*class BloodBankPage extends StatefulWidget {
  @override
  _BloodBankPageState createState() => _BloodBankPageState();
}*/
/*
class _BloodBankPageState extends State<BloodBankPage> {
  String? _selectedBloodGroup; // Variable to hold the selected blood group
  bool _interestedInDonation = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter Your Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SelectFormField(
                  type: SelectFormFieldType.dropdown, // Set the type to dropdown
                  decoration: InputDecoration(
                    labelText: 'Select Your Blood Group',
                  ),
                  items: [
                    {
                      'value': 'A+',
                      'label': 'A+',
                    },
                    {
                      'value': 'A-',
                      'label': 'A-',
                    },
                    {
                      'value': 'B+',
                      'label': 'B+',
                    },
                    {
                      'value': 'B-',
                      'label': 'B-',
                    },
                    {
                      'value': 'O+',
                      'label': 'O+',
                    },
                    {
                      'value': 'O-',
                      'label': 'O-',
                    },
                    {
                      'value': 'AB+',
                      'label': 'AB+',
                    },
                    {
                      'value': 'AB-',
                      'label': 'AB-',
                    },
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text('Interested in Blood Donation?'),
                  value: _interestedInDonation,
                  onChanged: (value) {
                    setState(() {
                      _interestedInDonation = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_interestedInDonation) {
                        // Add user to blood donators list
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Thank You!'),
                            content: Text(
                                'You have been added to the blood donators list.'),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Thank You!'),
                            content: Text('Thank you for your interest.'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

class BloodBankPage extends StatefulWidget {
  @override
  _BloodBankPageState createState() => _BloodBankPageState();
}

class _BloodBankPageState extends State<BloodBankPage> {
  String _bloodGroup = '';

  bool _interestedInDonation = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter Your Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Enter Your Blood Group'),
                  onChanged: (value) {
                    setState(() {
                      _bloodGroup = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text('Interested in Blood Donation?'),
                  value: _interestedInDonation,
                  onChanged: (value) {
                    setState(() {
                      _interestedInDonation = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_interestedInDonation) {
                        // Add user to blood donators list
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Thank You!'),
                            content: Text(
                                'You have been added to the blood donators list.'),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Thank You!'),
                            content: Text('Thank you for your interest.'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Center(
        child: Text('Report Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open report dialog
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
