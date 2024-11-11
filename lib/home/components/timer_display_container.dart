import 'package:flutter/material.dart';
import 'package:task_tock/home/timer_type.dart';

class TimerDisplayContainer extends StatelessWidget {
  const TimerDisplayContainer({
    super.key,
    required this.timerType,
    required this.time,
  });

  final TimerType timerType;
  final int time;

  @override
  Widget build(BuildContext context) => Container(
        width: 225,
        height: 225,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: timerType == TimerType.ready
                ? const Color(0xFF5E59F1)
                : const Color(0xFFFF3B5C),
            width: 10,
          ),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Focus',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              timerText,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              timerType.displayText,
              style: TextStyle(
                color: timerType == TimerType.ready
                    ? const Color(0xFFADAAFF)
                    : const Color(0xFFFFA3B3),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );

  String get timerText {
    final minutes = time ~/ 60;
    final seconds = time % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
