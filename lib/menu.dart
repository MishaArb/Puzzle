import 'package:flutter/material.dart';
import 'reset.dart';
import 'package:puzzle_game/step.dart';
import 'package:puzzle_game/best_result.dart';

class Menu extends StatelessWidget {
  Function clickReset;
  int count;
  int bestResult;
  Menu(this.clickReset, this.count, this.bestResult);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResetButton(clickReset),
          Steps(count),
          BestResult(bestResult),
        ],
      ),
    );
  }
}
