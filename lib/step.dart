import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  int count;
  Steps(this.count);
  @override
  Widget build(BuildContext context) {
    return Text(
      count <= 1 ? 'STEP: $count' : 'STEPS: $count',
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
