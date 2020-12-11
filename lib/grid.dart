import 'package:flutter/material.dart';
import 'package:puzzle_game/grid_button.dart';

class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;
  String img;
  int width;
  Grid(this.numbers, this.size, this.clickGrid, this.img, this.width);
  @override
  Widget build(BuildContext context) {
    var height = size.height;
    return Container(
      // color: Colors.red,
      height: height * 0.65,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width, mainAxisSpacing: 2, crossAxisSpacing: 2),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != img
                ? GridButton('${numbers[index]}', () {
                    clickGrid(index);
                  })
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
