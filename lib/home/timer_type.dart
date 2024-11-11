import 'package:flutter/material.dart';

enum TimerType {
  ready(
    displayText: 'Ready??',
    buttonText: 'スタート',
    buttonColor: Color(0xFF5E59F1),
  ),
  running(
    displayText: 'Running...',
    buttonText: 'ご褒美のTikTokを見る',
    buttonColor: Color(0xFFD9D9D9),
  ),
  finish(
    displayText: 'finish',
    buttonText: 'ご褒美のTikTokを見る',
    buttonColor: Color(0xFFFF3B5C),
  );

  const TimerType({
    required this.displayText,
    required this.buttonText,
    required this.buttonColor,
  });

  final String displayText;
  final String buttonText;
  final Color buttonColor;
}
