import 'package:flutter/material.dart';
import 'package:jsap/AnalysisPage.dart';

class UploadSuccessPage extends StatefulWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
