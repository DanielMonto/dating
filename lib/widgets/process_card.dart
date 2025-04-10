import 'package:process/models/process.dart';
import 'package:flutter/material.dart';

class ProcessCard extends StatelessWidget {
  final Process process;
  const ProcessCard({super.key, required this.process});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black38,
        ),
      ),
    );
  }
}
