import 'package:flutter/material.dart';

enum TimerType {
  ready(
    displayText: 'Ready??',
    buttonText: 'スタート',
    color: Color(0xFF5E59F1),
  ),
  running(
    displayText: 'Running...',
    buttonText: 'ご褒美のTikTokを見る',
    color: Color(0xFFD9D9D9),
  ),
  finish(
    displayText: 'finish',
    buttonText: 'ご褒美のTikTokを見る',
    color: Color(0xFFFF3B5C),
  );

  const TimerType({
    required this.displayText,
    required this.buttonText,
    required this.color,
  });

  final String displayText;
  final String buttonText;
  final Color color;
}
