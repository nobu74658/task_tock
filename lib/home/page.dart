import 'package:flutter/material.dart';
import 'package:task_tock/home/timer_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimerType timerType = TimerType.running;

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
            color: const Color(0xFFFFA3B3).withOpacity(0.5),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                  ),
                  Container(
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
                        const Text(
                          '25:00',
                          style: TextStyle(
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: timerType == TimerType.ready
                  ? const Color(0xFF5E59F1)
                  : const Color(0xFFFF3B5C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                timerType == TimerType.ready ? 'スタート' : 'ご褒美のTikTokを見る',
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
}
