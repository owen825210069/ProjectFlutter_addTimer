import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerPage> {
  TextEditingController _controller = TextEditingController();
  int _timeInSeconds = 0;
  int _currentTime = 0;
  bool _isRunning = false;
  Timer? _timer;

  void showValidationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error!"),
          content: Text("Please enter a valid time in seconds to start the Timer."),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showTimeUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Time's Up!"),
          content: Text("The timer has finished."),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void startTimer() {
    if (_timeInSeconds <= 0 || _isRunning) {
      showValidationDialog(context);
      return;
    }

    setState(() {
      _isRunning = true;
      _currentTime = _timeInSeconds;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        setState(() {
          _currentTime--;
        });
      } else {
        setState(() {
          _isRunning = false;
        });
        timer.cancel();
        showTimeUpDialog(context);
      }
    });
  }

  void pauseTimer() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
      });
      _timer?.cancel();
    }
  }

  void resetTimer() {
    if (_isRunning) {
      _timer?.cancel();
    }
    setState(() {
      _isRunning = false;
      _timeInSeconds = 0;
      _currentTime = 0;
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Timer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Time Remaining:',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                  '$_currentTime seconds',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Set Time (seconds)',
                ),
                onChanged: (value) {
                  setState(() {
                    _timeInSeconds = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _isRunning ? null : startTimer,
                    child: Text('Start'),
                  ),
                  ElevatedButton(
                    onPressed: _isRunning ? pauseTimer : null,
                    child: Text('Pause'),
                  ),
                  ElevatedButton(
                    onPressed: resetTimer,
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
