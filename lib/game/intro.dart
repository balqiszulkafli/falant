import 'package:falant/game/launch_screen.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                "Color Boxes Game",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 100),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.green,
                  width: 4,
                ),
              ),
              margin: const EdgeInsets.only(top: 80, right: 4, left: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: () {
                  _goToLaunchScreen();
                },
                child: const Text(
                  "Launch Game",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 80),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // go to game launch
  _goToLaunchScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LaunchScreen(),
        ));
  }
}
