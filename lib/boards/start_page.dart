import 'package:flutter/material.dart';
import 'package:puzzle_game/boards/board3x3.dart';
import 'package:puzzle_game/boards/board5x5.dart';
import 'package:puzzle_game/boards/board6x6.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.jpg'),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PUZZLE',
              style: TextStyle(
                  color: Color.fromARGB(255, 28, 134, 193),
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            NewWidget('images/motorcycle.jpg', Board3X3()),
            SizedBox(
              height: 15,
            ),
            NewWidget('images/car.jpg', Board5X5()),
            SizedBox(
              height: 15,
            ),
            NewWidget('images/city.jpg', Board6X6()),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String img;
  final Widget rout;
  NewWidget(this.img, this.rout);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => rout,
          ),
        );
      },
      child: Container(
        width: 150,
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              img,
            ),
          ),
        ),
      ),
    );
  }
}
