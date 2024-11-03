import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_tock/home/components/timer_display_container.dart';
import 'package:task_tock/home/timer_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  int get startTime => 10;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  TimerType timerType = TimerType.ready;
  int time = 0;
  Timer? timer;

  @override
  void initState() {
    time = widget.startTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              fit: BoxFit.cover,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT07sFo4jrWiaW7EZcCmHN1UmfsvGqVDO5W0A&s',
            ),
          ),
          ColoredBox(
            color: const Color(0xFFFFA3B3)
                .withOpacity(_progressRatio(widget.startTime)),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                  ),
                  TimerDisplayContainer(
                    timerType: timerType,
                    time: time,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: handleTimer,
            style: ElevatedButton.styleFrom(
              backgroundColor: timerType.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                timerType.buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleTimer() {
    if (timerType == TimerType.ready) {
      setState(() {
        timerType = TimerType.running;
      });
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (time == 0) {
            timer.cancel();
            timerType = TimerType.finish;
            time = 25 * 60;
          } else {
            time--;
          }
        });
      });
    } else {
      timer?.cancel();
      setState(() {
        timerType = TimerType.ready;
        time = 25 * 60;
      });
    }
  }

  double _progressRatio(int startTime) {
    final ratio = time / startTime;
    if (ratio > 1) {
      return 1;
    } else if (ratio < 0) {
      return 0;
    } else {
      return ratio;
    }
  }
}
