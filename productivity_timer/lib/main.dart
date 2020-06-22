import 'package:flutter/material.dart';
import 'package:productivitytimer/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Work Timer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My work timer'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(defaultPadding),
              ),
              Expanded(
                  child: ProductivityButton(
                color: Color(0xff009688),
                text: "Work",
                onPressed: emptyMethod,
                size: 150,
              )),
              Padding(
                padding: EdgeInsets.all(defaultPadding),
              ),
              Expanded(
                  child: ProductivityButton(
                color: Color(0xff607D8B),
                text: "Short Break",
                onPressed: emptyMethod,
                size: 150,
              )),
              Padding(
                padding: EdgeInsets.all(defaultPadding),
              ),
              Expanded(
                child: ProductivityButton(
                  color: Color(0xff455A64),
                  text: "Long Break",
                  onPressed: emptyMethod,
                  size: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(defaultPadding),
              ),
            ],
          )
        ],
      ),
    );
  }

  void emptyMethod() {}
}
