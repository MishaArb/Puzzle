import 'package:flutter/material.dart';
import 'package:puzzle_game/grid.dart';
// import 'reset.dart';
import 'package:puzzle_game/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Board3X3 extends StatefulWidget {
  @override
  _Board3X3State createState() => _Board3X3State();
}

class _Board3X3State extends State<Board3X3> {
  int stepCountMoto = 0;
  int bestResultMoto = 0;
  var moto = [
    'images/motoone.jpg',
    'images/mototwo.jpg',
    'images/motothree.jpg',
    'images/motofour.jpg',
    'images/motofive.jpg',
    'images/motosix.jpg',
    'images/motoseven.jpg',
    'images/motoeight.jpg',
    'images/motonine.jpg',
  ];

  var checkListMoto = [
    'images/motoone.jpg',
    'images/mototwo.jpg',
    'images/motothree.jpg',
    'images/motofour.jpg',
    'images/motofive.jpg',
    'images/motosix.jpg',
    'images/motoseven.jpg',
    'images/motoeight.jpg',
    'images/motonine.jpg',
  ];
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('moto', stepCountMoto);
  }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      bestResultMoto = prefs.getInt('moto') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    moto.shuffle();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Motorcycle',
        ),
        backgroundColor: Color.fromARGB(255, 129, 149, 160),
      ),
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.jpg'),
          ),
        ),
        child: Column(
          children: [
            Menu(clickReset, stepCountMoto, bestResultMoto),
            Grid(moto, size, click, 'images/motonine.jpg', 3),
          ],
        ),
      ),
    );
  }

  void click(index) {
    if (index - 1 >= 0 &&
            moto[index - 1] == 'images/motonine.jpg' &&
            index % 3 != 0 ||
        index + 1 < 9 &&
            moto[index + 1] == 'images/motonine.jpg' &&
            (index + 1) % 3 != 0 ||
        (index - 3 >= 0 && moto[index - 3] == 'images/motonine.jpg') ||
        (index + 3 < 9 && moto[index + 3] == 'images/motonine.jpg')) {
      setState(() {
        moto[moto.indexOf('images/motonine.jpg')] = moto[index];
        moto[index] = 'images/motonine.jpg';
        stepCountMoto++;
      });
    }
    checkWin(moto, checkListMoto);
  }

  void checkWin(List a, List b) {
    if (a.join() == b.join()) {
      if (stepCountMoto < bestResultMoto || bestResultMoto == 0) {
        saveData();
        readData();
      }
    }
  }

  void clickReset() {
    setState(() {
      moto.shuffle();
      stepCountMoto = 0;
    });
  }
}
