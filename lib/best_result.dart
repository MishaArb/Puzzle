import 'package:flutter/material.dart';

class BestResult extends StatelessWidget {
  int bestResult;
  BestResult(this.bestResult);
  @override
  Widget build(BuildContext context) {
    return Text(
      'BEST: $bestResult',
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
