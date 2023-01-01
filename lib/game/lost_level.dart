import 'package:falant/model/stats.dart';
import 'package:flutter/material.dart';

class LostScreen extends StatefulWidget {
  const LostScreen({super.key, required this.stats});

  final Stats stats;

  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> {
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
