import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double _numberForm;

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_numberForm.toString()),
              TextField(
                onChanged: (text){
                  var inputNumber = double.parse(text);
                  if(inputNumber != null){
                    setState(() {
                      _numberForm = inputNumber;
                    });
                  }
                },
              ),
            ],
          ),
        ),),
    );}
}
