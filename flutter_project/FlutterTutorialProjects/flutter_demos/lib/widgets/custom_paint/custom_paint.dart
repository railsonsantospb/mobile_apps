import 'package:flutter/material.dart';
import 'progress_painter.dart';
import 'dart:ui';
import 'dart:async';

class CustomDemo extends StatefulWidget {
  CustomDemo() : super();

  final String title = "Custom Paint Demo";

  @override
  CustomDemoState createState() => CustomDemoState();
}

class CustomDemoState extends State<CustomDemo>
    with SingleTickerProviderStateMixin {
  //
  double _percentage;
  double _nextPercentage;
  Timer _timer;
  AnimationController _progressAnimationController;
  bool _progressDone;

  @override
  initState() {
    super.initState();
    _percentage = 0.0;
    _nextPercentage = 0.0;
    _timer = null;
    _progressDone = false;
    initAnimationController();
  }

  initAnimationController() {
    _progressAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(
        () {
          setState(() {
            _percentage = lerpDouble(_percentage, _nextPercentage,
                _progressAnimationController.value);
          });
        },
      );
  }

  start() {
    Timer.periodic(Duration(milliseconds: 30), handleTicker);
  }

  handleTicker(Timer timer) {
    _timer = timer;
    if (_nextPercentage < 100) {
      publishProgress();
    } else {
      timer.cancel();
      setState(() {
        _progressDone = true;
      });
    }
  }

  startProgress() {
    if (null != _timer && _timer.isActive) {
      _timer.cancel();
    }
    setState(() {
      _percentage = 0.0;
      _nextPercentage = 0.0;
      _progressDone = false;
      start();
    });
  }

  publishProgress() {
    setState(() {
      _percentage = _nextPercentage;
      _nextPercentage += 0.5;
      if (_nextPercentage > 100.0) {
        _percentage = 0.0;
        _nextPercentage = 0.0;
      }
      _progressAnimationController.forward(from: 0.0);
    });
  }

  getDoneImage() {
    return Image.asset(
      "images/checkmark.png",
      width: 50,
      height: 50,
    );
  }

  getProgressText() {
    return Text(
      _nextPercentage == 0 ? '' : '${_nextPercentage.toInt()}',
      style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.w800, color: Colors.green),
    );
  }

  progressView() {
    return CustomPaint(
      child: Center(
        child: _progressDone ? getDoneImage() : getProgressText(),
      ),
      foregroundPainter: ProgressPainter(
          defaultCircleColor: Colors.amber,
          percentageCompletedCircleColor: Colors.green,
          completedPercentage: _percentage,
          circleWidth: 50.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(30.0),
              child: progressView(),
            ),
            OutlineButton(
              child: Text("START"),
              onPressed: () {
                startProgress();
              },
            )
          ],
        ),
      ),
    );
  }
}
