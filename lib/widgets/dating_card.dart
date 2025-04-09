import 'package:date/models/dating.dart';
import 'package:flutter/material.dart';

class DatingCard extends StatelessWidget {
  final Dating dating;
  const DatingCard({super.key, required this.dating});

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
