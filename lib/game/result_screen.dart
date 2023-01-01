import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.result});
  final String result;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String result;

  @override
  void initState() {
    super.initState();
    result = widget.result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result),
          InkWell(
            onTap: () => {},
            child: const Text("Reset"),
          ),
        ],
      )),
    );
  }
}
