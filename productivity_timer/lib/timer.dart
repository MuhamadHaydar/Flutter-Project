import 'dart:async';

import 'package:productivitytimer/timermodel.dart';

class CountDownTimer {
  // The amount of work time.
  int work = 30;

  // The radius for the percentage of the circular.
  double _radius = 1;

  // IsActive to know when to work or not.
  bool _isActive = true;

  // The timer works as timer.
  Timer timer;

  // The remained time after the work started.
  Duration _time;

  // The full time.
  Duration _fullTime;

  Stream<TimerModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      String time;
      if (this._isActive) {
        _time = _time - Duration(seconds: 1);
        _radius = _time.inSeconds / _fullTime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }
      time = returnTime(_time);
      return TimerModel(time, _radius);
    });
  }

  /*
  The method takes the Duration as parameter and return the
  String as a time formation: 29:05
   */
  String returnTime(Duration t) {
    String minutes = (t.inMinutes < 10)
        ? '0' + t.inMinutes.toString()
        : t.inMinutes.toString();
    int numSeconds = t.inSeconds - (t.inMinutes * 60);
    String seconds =
    (numSeconds < 10) ? '0' + numSeconds.toString() : numSeconds.toString();
    String formattedTime = minutes + ":" + seconds;
    return formattedTime;
  }

  /*
  The method set the _time duration to the number of minutes
  contained in the work variable, and the same for the _fullTime
  field.
   */
  void startWork() {
    _radius = 1;
    _time = Duration(minutes: this.work, seconds: 0);
    _fullTime = _time;
  }

}
