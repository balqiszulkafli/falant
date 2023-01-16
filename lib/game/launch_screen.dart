import 'package:falant/game/play_screen.dart';
import 'package:falant/model/level.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.purple))),
              child: const Text(
                "4 Levels Game",
                style: TextStyle(fontSize: 40, color: Colors.pink),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: const Text(
                "to score, drag colored Box to fill the opaque boxes",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.blue))),
              child: const Text(
                "UpNext : Level 1",
                style: TextStyle(fontSize: 35, color: Colors.pink),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: Colors.blue, width: 4)),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.only(top: 80),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => _goToPlayScreen(),
                  child: const Text(
                    "Start Game",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _goToPlayScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              D15(level: Level(id: 1, name: "One", duration: 30, points: 25)),
        ));
  }
}
