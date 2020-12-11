import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  Function clickReset;
  ResetButton(this.clickReset);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Color.fromARGB(255, 28, 134, 193),
      child: Row(
        children: [
          Text(
            'RESET',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.rotate_left, color: Colors.white),
          )
        ],
      ),
      onPressed: clickReset,
    );
  }
}
