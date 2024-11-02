enum TimerType {
  ready(displayText: 'Ready??'),
  running(displayText: 'Running...'),
  finish(displayText: 'finish');

  const TimerType({required this.displayText});

  final String displayText;
}
