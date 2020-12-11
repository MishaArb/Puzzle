import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  String image;
  Function onPressed;
  GridButton(this.image, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onTap: onPressed,
    );
  }
}
