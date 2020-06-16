import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _numberForm;

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds(lbs)',
    'ounces'
  ];

  String _startMeasure;

  @override
  void initState() {
    _numberForm = 0;
    _startMeasure = _measures[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                value: _startMeasure,
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value;
                  });
                },
                items: _measures.map((String values) {
                  return DropdownMenuItem<String>(
                    child: Text(values),
                    value: values,
                  );
                }).toList(),
              ),
              Text(_numberForm.toString()),
              TextField(
                onChanged: (text) {
                  var inputNumber = double.parse(text);
                  if (inputNumber != null) {
                    setState(() {
                      _numberForm = inputNumber;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
