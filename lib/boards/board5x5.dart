import 'package:flutter/material.dart';
import 'package:puzzle_game/grid.dart';
import 'package:puzzle_game/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Board5X5 extends StatefulWidget {
  @override
  _Board5X5State createState() => _Board5X5State();
}

class _Board5X5State extends State<Board5X5> {
  int stepCountCar = 0;
  int bestResultCar = 0;
  var car = [
    'images/car01.jpg',
    'images/car02.jpg',
    'images/car03.jpg',
    'images/car04.jpg',
    'images/car05.jpg',
    'images/car06.jpg',
    'images/car07.jpg',
    'images/car08.jpg',
    'images/car09.jpg',
    'images/car10.jpg',
    'images/car11.jpg',
    'images/car12.jpg',
    'images/car13.jpg',
    'images/car14.jpg',
    'images/car15.jpg',
    'images/car16.jpg',
    'images/car17.jpg',
    'images/car18.jpg',
    'images/car19.jpg',
    'images/car20.jpg',
    'images/car21.jpg',
    'images/car22.jpg',
    'images/car23.jpg',
    'images/car24.jpg',
    'images/car25.jpg',
  ];

  var checkListCar = [
    'images/car01.jpg',
    'images/car02.jpg',
    'images/car03.jpg',
    'images/car04.jpg',
    'images/car05.jpg',
    'images/car06.jpg',
    'images/car07.jpg',
    'images/car08.jpg',
    'images/car09.jpg',
    'images/car10.jpg',
    'images/car11.jpg',
    'images/car12.jpg',
    'images/car13.jpg',
    'images/car14.jpg',
    'images/car15.jpg',
    'images/car16.jpg',
    'images/car17.jpg',
    'images/car18.jpg',
    'images/car19.jpg',
    'images/car20.jpg',
    'images/car21.jpg',
    'images/car22.jpg',
    'images/car23.jpg',
    'images/car24.jpg',
    'images/car25.jpg',
  ];
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('car', stepCountCar);
  }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      bestResultCar = prefs.getInt('car') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    car.shuffle();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car',
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
            Menu(clickReset, stepCountCar, bestResultCar),
            Grid(car, size, click, 'images/car25.jpg', 5),
          ],
        ),
      ),
    );
  }

  void click(index) {
    if (index - 1 >= 0 &&
            car[index - 1] == 'images/car25.jpg' &&
            index % 5 != 0 ||
        index + 1 < 25 &&
            car[index + 1] == 'images/car25.jpg' &&
            (index + 1) % 5 != 0 ||
        (index - 5 >= 0 && car[index - 5] == 'images/car25.jpg') ||
        (index + 5 < 25 && car[index + 5] == 'images/car25.jpg')) {
      setState(() {
        car[car.indexOf('images/car25.jpg')] = car[index];
        car[index] = 'images/car25.jpg';
        stepCountCar++;
      });
    }
    checkWin(car, checkListCar);
  }

  void checkWin(List a, List b) {
    if (a.join() == b.join()) {
      if (stepCountCar < bestResultCar || bestResultCar == 0) {
        saveData();
        readData();
      }
    }
  }

  void clickReset() {
    setState(() {
      car.shuffle();
      stepCountCar = 0;
    });
  }
}
