import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // The input number.
  double _numberForm;

  // Whole measures.
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

  // The From measure to be converted.
  String _startMeasure;

  // The To measure to be converted.
  String _convertedMeasure;

  // The text stories the result message of conversion.
  String _resultMessage;

  // Text style for the user input texts.
  final TextStyle inputStyle = TextStyle(fontSize: 20, color: Colors.blue[900]);

  // Text style for the label texts.
  final TextStyle labelStyle =
      TextStyle(fontSize: 20, color: Colors.green[700]);

  //measuresMap is used to map with numbers.
  final Map<String, int> _measuresMap = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds(lbs)': 6,
    'ounces': 7
  };

  // The variable saves numbers according the conversion formula.
  dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

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
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              // Spaces is the widget used to add space.
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
                onPressed: () {
                  // Check if both conversions selected or not:
                  if (_startMeasure == null || _convertedMeasure == null) {
                    Fluttertoast.showToast(
                        msg: "Select the Measurement",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  } else {
                    convert(_numberForm, _startMeasure, _convertedMeasure);
                  }
                },
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                (_resultMessage == null) ? '' : _resultMessage,
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


  // Method to convert the conversion.
  void convert(double value, String from, String to) {
    int nfrom = _measuresMap[from];
    int nto = _measuresMap[to];
    var multiplier = _formulas[nfrom.toString()][nto];
    print('This is multiplier from $from to $to $multiplier');
    var result = value * multiplier;
    if (result == 0) {
      _resultMessage = 'This conversion cannot be performed';
    } else {
      _resultMessage = '${_numberForm.toString()} $_startMeasure are ${result
          .toString()} $_convertedMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }

}
