import 'package:falant/game/launch_screen.dart';
import 'package:falant/model/box.dart';
import 'package:falant/repository/boxes/boxes.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key,
      required this.result,
      required this.mismatches,
      required this.total});
  final String result;
  final int mismatches;
  final int total;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String result;
  late int mismatches, total;

  @override
  void initState() {
    super.initState();
    result = widget.result;
    mismatches = widget.mismatches;
    total = widget.total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(220, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Your Result",
              style: TextStyle(
                  fontFamily: 'DM Sans Regular',
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            Text("Error: $mismatches / $total"),
            const SizedBox(height: 16),
            SizedBox(
              width: 326,
              height: 326,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Center(
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'DM Sans Regular',
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Please consult with your specialist for\nconfirmation",
              style: TextStyle(
                fontFamily: 'DM Sans Regular',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50, //height of button
                    width: 130, //width of button
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromARGB(220, 255, 255, 255),
                            side: const BorderSide(color: Colors.black)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LaunchScreen()));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 50, //height of button
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LaunchScreen()));
                        },
                        child: Text("Reset")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
