import 'package:flutter/material.dart';

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
