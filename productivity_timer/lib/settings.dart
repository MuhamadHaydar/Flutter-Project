import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivitytimer/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Settings());
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextStyle textStyle = TextStyle(fontSize: 24);

  // Used to control over the text fields.
  TextEditingController txtWork;
  TextEditingController txtShort;
  TextEditingController txtLong;

  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";

  int workTime;
  int shortBreak;
  int longBreak;

  // Use shared preference to save data.
  SharedPreferences prefs;

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      childAspectRatio: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
            Text("Work", style: textStyle),
            Text(""),
            Text(""),
            SettingButton(Color(0xff455A64), "-", -1),
            TextField(
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: txtWork,
            ),
            SettingButton(
              Color(0xff009688),
              "+",
              1,
            ),
            Text("Short", style: textStyle),
            Text(""),
            Text(""),
            SettingButton(
              Color(0xff455A64),
              "-",
              -1,
            ),
            TextField(
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: txtShort,
            ),
            SettingButton(Color(0xff009688), "+", 1),
            Text(
              "Long",
              style: textStyle,
            ),
            Text(""),
            Text(""),
            SettingButton(
              Color(0xff455A64),
              "-",
              -1,
            ),
            TextField(
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: txtLong,
            ),
            SettingButton(
              Color(0xff009688),
              "+",
              1,
            ),
          ],
          padding: const EdgeInsets.all(20.0),
        ));
  }
}
