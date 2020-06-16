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

  String _convertedMeasure;

  // Text style for the user input texts.
  final TextStyle inputStyle = TextStyle(fontSize: 20, color: Colors.blue[900]);

  // Text style for the label texts.
  final TextStyle labelStyle =
      TextStyle(fontSize: 20, color: Colors.green[700]);

  @override
  void initState() {
    _numberForm = 0;
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Spacer(), // Spaces is the widget used to add space.
              Text(
                'Value',
                style: labelStyle,
              ),
              Spacer(),
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                    hintText: 'please insert the measure to be converted'),
                onChanged: (text) {
                  var inputNumber = double.parse(text);
                  if (inputNumber != null) {
                    setState(() {
                      _numberForm = inputNumber;
                    });
                  }
                },
              ),
              Spacer(),
              Text(
                'From',
                style: labelStyle,
              ),
              Spacer(),
              DropdownButton(
                isExpanded: true,
                value: _startMeasure,
                style: inputStyle,
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
              Text(
                'To',
                style: labelStyle,
              ),
              Spacer(),
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                value: _convertedMeasure,
                onChanged: (value) {
                  setState(() {
                    _convertedMeasure = value;
                  });
                },
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
              Spacer(
                flex: 2,
              ),
              RaisedButton(
                child: Text(
                  'Convert',
                  style: inputStyle,
                ),
                onPressed: () {},
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                _numberForm.toString(),
                style: labelStyle,
              ),
              Spacer(
                flex: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
