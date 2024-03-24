import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PatientInfoPage extends StatefulWidget {
  @override
  _PatientInfoPageState createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  String? selectedGender; // State variable for selected gender
  List<String> genderOptions = [
    'Male',
    'Female'
  ]; // Options for gender selection

  String? patientName;
  String? patientID;
  String? age;
  String? bloodPressure;
  String? referredByDoctor;

  // Existing method to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? selected =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = selected;
    });
  }

  // New method to capture an image using the camera
  Future<void> _captureImage() async {
    final XFile? captured = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = captured;
    });
  }

  // Method to check if all necessary fields are filled
  bool _areFieldsFilled() {
    return patientName != null &&
        patientID != null &&
        selectedGender != null &&
        age != null &&
        bloodPressure != null &&
        referredByDoctor != null &&
        _imageFile != null;
  }

  // Method to navigate to UploadSuccessPage if all fields are filled
  void _navigateToUploadSuccessPage() {
    if (_areFieldsFilled()) {
      // Convert XFile to File
      File file = File(_imageFile!.path);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UploadSuccessPage(imageFile: file)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the fields and capture an image.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Medical Scan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (_imageFile != null) Image.file(File(_imageFile!.path)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Patient Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        patientName = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Patient ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        patientID = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: selectedGender,
                    hint: Text('Select Gender'),
                    items: genderOptions.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        age = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Blood Pressure',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        bloodPressure = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Referred By Doctor',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        referredByDoctor = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.image),
                            title: Text('Pick Image'),
                            onTap: _pickImage,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.upload_outlined),
                            title: Text('Upload Scan'),
                            onTap: _captureImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _navigateToUploadSuccessPage,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//--------------------------------------------------------------------

class UploadSuccessPage extends StatefulWidget {
  final File imageFile;

  UploadSuccessPage({super.key, required this.imageFile});

  @override
  _UploadSuccessPageState createState() => _UploadSuccessPageState();
}

class _UploadSuccessPageState extends State<UploadSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Upload Success'),
      ),
      body: ListView(
        children: [
          Image.file(
            widget.imageFile,
            width: double.infinity, // Full width
            height: 200,
            fit: BoxFit.cover, // Cover the width of the screen
          ),
          SizedBox(height: 20),
          Center(
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 50,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to analysis page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnalysisPage(
                      'Test Type',
                      'Analysis Result',
                    ),
                  ),
                );
              },
              child: Text('Analyse Report'),
            ),
          ),
        ],
      ),
    );
  }
}

//---------------------------------------

class AnalysisPage extends StatefulWidget {
  final String testType;
  final String analysisResult;

  AnalysisPage(this.testType, this.analysisResult);

  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  bool hasDisease = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Analysis'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Name: Athi AA',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 18), // Accessing text theme here
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Age: 18',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 18), // Accessing text theme here
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Disease Prediction:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 18), // Accessing text theme here
                        ),
                        Switch(
                          value: hasDisease,
                          onChanged: (value) {
                            setState(() {
                              hasDisease = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            hasDisease
                ? Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Disease Details:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 18), // Accessing text theme here
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Name: Hypertension',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 18), // Accessing text theme here
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cause: High blood pressure',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 18), // Accessing text theme here
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Info: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 18), // Accessing text theme here
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Report Information: ${widget.analysisResult}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 18), // Accessing text theme here
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
