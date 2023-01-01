//won screen

import 'package:falant/model/stats.dart';
import 'package:flutter/material.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({super.key, required this.stats});

  final Stats stats;

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  late Stats stats;

  @override
  void initState() {
    super.initState();
    stats = widget.stats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(stats.status),
          InkWell(
            onTap: () => {},
            child: const Text("Reset"),
          ),
        ],
      )),
    );
  }
}
